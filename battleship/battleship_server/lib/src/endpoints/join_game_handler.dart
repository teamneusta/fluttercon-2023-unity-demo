import 'dart:math';

import 'package:battleship_server/src/endpoints/game_handler.dart';
import 'package:battleship_server/src/generated/protocol.dart';
import 'package:collection/collection.dart';

class JoinGameHandler extends GameHandler<JoinGameCommand> {
  JoinGameHandler(super.msg);

  @override
  Future<void> handle() async {
    final joinGameCommand = msg;

    final game = activeGames.firstWhereOrNull(
      (g) => g.pin == joinGameCommand.pin,
    );
    if (game == null) {
      send(ErrorMessage(message: 'There is no game with that pin'));
    } else if (game.players.length == 2 &&
        !game.players.any((p) => p.id == joinGameCommand.player.id)) {
      send(ErrorMessage(message: 'That game is already full'));
    } else {
      final player1 = game.players.first;
      final player2 = joinGameCommand.player;
      final rnd = Random();

      final nextGameState = GameState(
        pin: game.pin,
        width: game.width,
        height: game.height,
        players: [player1, player2],
        ships: [
          Ship(
            name: "raft",
            ownerId: player1.id,
            size: 1,
            x: rnd.nextInt(game.width),
            y: rnd.nextInt(game.height),
            directionAsInt: 0,
          ),
          Ship(
            name: "raft",
            ownerId: player2.id,
            size: 1,
            x: rnd.nextInt(game.width),
            y: rnd.nextInt(game.height),
            directionAsInt: 0,
          )
        ],
        shots: [],
        currentPlayerId: player1.id,
      );

      updateGame(nextGameState);
    }
  }
}
