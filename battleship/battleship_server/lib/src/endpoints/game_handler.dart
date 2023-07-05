import 'package:battleship_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

typedef SendStreamMessage = Future<void> Function(
  StreamingSession session,
  SerializableEntity message,
);

abstract class GameHandler<Msg> {
  final Msg msg;

  GameHandler(this.msg);

  late StreamingSession session;
  late SendStreamMessage sendStreamMessage;
  late List<GameState> activeGames;

  void prepare(
    StreamingSession session,
    SendStreamMessage sendStreamMessage,
    List<GameState> activeGames,
  ) {
    this.session = session;
    this.sendStreamMessage = sendStreamMessage;
    this.activeGames = activeGames;
  }

  void send(SerializableEntity message) => sendStreamMessage(session, message);

  void updateGame(GameState game) {
    final index = activeGames.indexWhere((g) => g.pin == game.pin);
    if (index != -1) {
      activeGames[index] = game;
    } else {
      activeGames.add(game);
    }
    for (var player in game.players) {
      session.messages.postMessage(player.id, game);
    }
    session.messages.postMessage("lobby", LobbyState(activeGames: activeGames));
  }

  Future<void> handle();
}

abstract class ActiveGameHandler<Msg> extends GameHandler<Msg> {
  ActiveGameHandler(super.msg);

  String get pin;

  late final active = activeGames.firstWhere((g) => g.pin == pin);
}
