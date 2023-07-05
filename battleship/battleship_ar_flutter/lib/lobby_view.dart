import 'package:battleship_client/battleship_client.dart';
import 'package:flutter/material.dart';

class LobbyView extends StatefulWidget {
  final Player me;
  final List<GameState> activeGames;
  final ValueChanged<String> newGame;
  final ValueChanged<String> joinGame;
  final VoidCallback logout;

  const LobbyView({
    required this.me,
    required this.activeGames,
    required this.newGame,
    required this.joinGame,
    required this.logout,
  });

  @override
  State<LobbyView> createState() => _LobbyViewState();
}

class _LobbyViewState extends State<LobbyView> {
  final _gamePin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Welcome ${widget.me.name}!"),
            const Spacer(),
            IconButton(
              onPressed: widget.logout,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Expanded(
            child: ListView.builder(
          itemCount: widget.activeGames.length,
          itemBuilder: (context, index) {
            final game = widget.activeGames[index];

            return ListTile(
              title: Text("Game ${game.pin}"),
              subtitle: Text("${game.players.length} players"),
              trailing: game.players.length < 2
                  ? IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () => widget.joinGame(game.pin),
                    )
                  : null,
            );
          },
        )),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _gamePin,
                decoration: const InputDecoration(
                  hintText: 'Enter a game pin to start',
                ),
              ),
            )),
            IconButton(
                onPressed: () => widget.newGame(_gamePin.text),
                icon: const Icon(Icons.add)),
          ],
        )
      ],
    );
  }
}
