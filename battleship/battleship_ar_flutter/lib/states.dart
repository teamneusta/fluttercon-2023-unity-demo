import 'package:battleship_client/battleship_client.dart';

sealed class LocalState {}

class Loading extends LocalState {}

class Login extends LocalState {}

class Lobby extends LocalState {
  final LobbyState lobbyState;

  Lobby(this.lobbyState);
}

class Playing extends LocalState {
  final GameState game;

  Playing(this.game);
}
