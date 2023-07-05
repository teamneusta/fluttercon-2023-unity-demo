import 'package:battleship_server/src/endpoints/game_handler.dart';
import 'package:battleship_server/src/generated/protocol.dart';
import 'package:collection/collection.dart';

class ShootHandler extends GameHandler<ShootCommand> {
  ShootHandler(super.msg);

  @override
  Future<void> handle() async {
    final shootCommand = msg;

    final game = activeGames.firstWhereOrNull(
      (g) => g.pin == shootCommand.pin,
    );
    if (game == null) {
      send(ErrorMessage(message: 'There is no game with that pin'));
    } else {
      final shooterId =
          game.players.firstWhere((p) => p.id == shootCommand.shooterId).id;
      final otherId = game.players.firstWhere((p) => p.id != shooterId).id;

      final newShot = Shot(
          x: shootCommand.x,
          y: shootCommand.y,
          shooterId: shooterId,
          hit: game.ships.any(
            (ship) =>
                ship.ownerId == otherId &&
                ship.x == shootCommand.x &&
                ship.y == shootCommand.y,
          ));

      final nextGameState = GameState(
        pin: game.pin,
        width: game.width,
        height: game.height,
        players: game.players,
        ships: game.ships,
        shots: game.shots + [newShot],
        currentPlayerId: otherId,
        winnerId: newShot.hit ? shooterId : null,
      );

      updateGame(nextGameState);
      activeGames.removeWhere((g) => g.pin == game.pin);
      send(LobbyState(activeGames: activeGames));
      session.messages
          .postMessage(otherId, LobbyState(activeGames: activeGames));
    }
  }
}
