import 'package:battleship_server/src/endpoints/game_handler.dart';
import 'package:battleship_server/src/generated/protocol.dart';
import 'package:collection/collection.dart';

class PlayerOnlineHandler extends GameHandler<Player> {
  PlayerOnlineHandler(super.msg);

  @override
  Future<void> handle() async {
    final player = msg;

    final activeGame = activeGames.firstWhereOrNull(
      (game) => game.players.any((p) => p.id == player.id),
    );

    session.messages.addListener(player.id, send);
    session.messages.addListener("lobby", send);

    if (activeGame == null) {
      send(LobbyState(activeGames: activeGames));
    } else {
      send(activeGame);
    }
  }
}
