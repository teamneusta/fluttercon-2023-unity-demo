import 'package:battleship_client/battleship_client.dart';
import 'package:battleship_ar_flutter/game_view.dart';
import 'package:battleship_ar_flutter/lobby_view.dart';
import 'package:battleship_ar_flutter/login_view.dart';
import 'package:battleship_ar_flutter/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

var client = Client('https://api.fluttar.xyz/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battleship',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  LocalState _gameState = Loading();
  late Player me;

  @override
  void initState() {
    super.initState();

    client.game.stream.listen((msg) {
      print("Received message: $msg");

      final playingState = _gameState is Playing ? _gameState as Playing : null;

      if (msg is LobbyState &&
          (_gameState is! Playing ||
              playingState != null && playingState.game.winnerId != null)) {
        if (playingState != null && playingState.game.winnerId != null) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Game over"),
                  content: Text(playingState.game.winnerId == me.id
                      ? "You won!"
                      : "You lost!"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("OK"))
                  ],
                );
              },
            );
          });
        }

        setState(() {
          _gameState = Lobby(msg);
        });
      } else if (msg is GameState) {
        setState(() {
          _gameState = Playing(msg);
        });
      }
    });

    checkLogin();
  }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString("id");
    final name = prefs.getString("name");
    if (id != null && name != null) {
      me = Player(
        id: id,
        name: name,
      );
      send(me);
    } else {
      setState(() {
        _gameState = Login();
      });
    }
  }

  Future<void> send(SerializableEntity message) async {
    if (client.streamingConnectionStatus ==
        StreamingConnectionStatus.disconnected) {
      await client.openStreamingConnection();
    }

    await client.game.sendStreamMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    final title = switch (_gameState) {
      Loading() => "Loading",
      Login() => "Login",
      Lobby() => "Lobby",
      Playing() => "Game",
    };

    final content = switch (_gameState) {
      Loading() => const Center(child: CircularProgressIndicator()),
      Login() => LoginView(
          login: (name) async {
            final id = const Uuid().v4();
            final prefs = await SharedPreferences.getInstance();
            prefs.setString("id", id);
            prefs.setString("name", name);

            me = Player(
              id: id,
              name: name,
            );

            await send(me);
            await checkLogin();
          },
        ),
      Lobby() => LobbyView(
          me: me,
          activeGames: (_gameState as Lobby).lobbyState.activeGames,
          newGame: (pin) => send(NewGameCommand(pin: pin, player: me)),
          joinGame: (pin) => send(JoinGameCommand(pin: pin, player: me)),
          logout: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.remove("id");
            prefs.remove("name");

            setState(() {
              _gameState = Login();
            });
          },
        ),
      Playing() => GameView(
          game: (_gameState as Playing).game,
          me: me,
          shoot: (x, y) => send(ShootCommand(
            pin: (_gameState as Playing).game.pin,
            x: x,
            y: y,
            shooterId: me.id,
          )),
        ),
    };

    return Scaffold(
      key: Key(_gameState.hashCode.toString()),
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.remove("id");
              prefs.remove("name");

              setState(() {
                _gameState = Login();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: content,
      ),
    );
  }
}
