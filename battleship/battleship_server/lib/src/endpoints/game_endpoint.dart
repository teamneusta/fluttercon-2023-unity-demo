import 'package:battleship_server/src/endpoints/game_handler.dart';
import 'package:battleship_server/src/endpoints/join_game_handler.dart';
import 'package:battleship_server/src/endpoints/new_game_handler.dart';
import 'package:battleship_server/src/endpoints/pllayer_online_handler.dart';
import 'package:battleship_server/src/endpoints/shoot_handler.dart';
import 'package:battleship_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GameEndpoint extends Endpoint {
  final List<GameState> activeGames = [];

  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableEntity message) async {
    print("Received message: $message");

    GameHandler? handler;
    if (message is Player) {
      handler = PlayerOnlineHandler(message);
    } else if (message is NewGameCommand) {
      handler = NewGameHandler(message);
    } else if (message is JoinGameCommand) {
      handler = JoinGameHandler(message);
    } else if (message is ShootCommand) {
      handler = ShootHandler(message);
    }

    await handler
      ?..prepare(
        session,
        sendStreamMessage,
        activeGames,
      )
      ..handle();
  }
}
