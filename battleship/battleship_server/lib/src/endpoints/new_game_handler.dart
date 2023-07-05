import 'package:battleship_server/src/endpoints/game_handler.dart';
import 'package:battleship_server/src/generated/protocol.dart';
import 'package:collection/collection.dart';

class NewGameHandler extends GameHandler<NewGameCommand> {
  NewGameHandler(super.msg);

  @override
  Future<void> handle() async {
    final newGameCommand = msg;

    final gameWithPin = activeGames.firstWhereOrNull(
      (g) => g.pin == newGameCommand.pin,
    );
    if (gameWithPin != null) {
      send(ErrorMessage(
        message: 'A game with that pin already exists',
      ));
    } else {
      final newGame = GameState(
        pin: newGameCommand.pin,
        width: 3,
        height: 3,
        players: [newGameCommand.player],
        ships: [],
        shots: [],
      );
      updateGame(newGame);
    }
  }
}
