import 'package:battleship_ar_flutter/grid.dart';
import 'package:battleship_client/battleship_client.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:universal_platform/universal_platform.dart';

class GameView extends StatefulWidget {
  final GameState game;
  final Function(int x, int y) shoot;
  final Player me;

  const GameView({
    required this.game,
    required this.shoot,
    required this.me,
  });

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late final UnityWidgetController _unityWidgetController;

  String get myId => widget.me.id;

  String get otherId =>
      widget.game.players
          .firstWhereOrNull(
            (p) => p.id != widget.me.id,
          )
          ?.id ??
      "";

  @override
  void didUpdateWidget(covariant GameView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.game != oldWidget.game) {
      final ownGrid = Grid(widget.game.width, widget.game.height);
      final enemyGrid = Grid(widget.game.width, widget.game.height);
      for (final shot in widget.game.shots) {
        if (shot.shooterId == myId) {
          enemyGrid.set(shot.x, shot.y, shot.hit ? 2 : 1);
        } else {
          ownGrid.set(shot.x, shot.y, shot.hit ? 2 : 1);
        }
      }
      final ship = widget.game.ships.firstWhere((element) {
        return element.ownerId == myId;
      });

      ownGrid.set(ship.x, ship.y, 3);

      _unityWidgetController.postMessage(
        'GameManager',
        'NotifyGameUpdate',
        "${ownGrid.toString()}&${enemyGrid.toString()}",
      );

      _unityWidgetController.postMessage(
        'GameManager',
        'NotifyPlayerUpdate',
        "${widget.game.currentPlayerId == myId ? 0 : 1}",
      );
      _unityWidgetController.postJsonMessage(
          "GameManager", "OnShotFired", widget.game.shots.last.toJson());
    }
    // _unityWidgetController.postMessage(
    //   'GameManager',
    //   'Notify',
    //   widget.game.toString(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final currentPlayer = widget.game.players.firstWhereOrNull(
      (p) => p.id == widget.game.currentPlayerId,
    );

    return UniversalPlatform.isWeb
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (currentPlayer != null)
                Text("Current player: ${currentPlayer.name}")
              else
                const Text("Waiting for other player to join"),
              const SizedBox(height: 48),
              const Text("Other player"),
              for (var y = 0; y < widget.game.height; y++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var x = 0; x < widget.game.width; x++)
                      _cell(
                        context,
                        x,
                        y,
                        otherId,
                        myId,
                      ),
                  ],
                ),
              const SizedBox(height: 48),
              const Text("Your field"),
              for (var y = 0; y < widget.game.height; y++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var x = 0; x < widget.game.width; x++)
                      _cell(
                        context,
                        x,
                        y,
                        myId,
                        otherId,
                      )
                  ],
                ),
            ],
          )
        : UnityWidget(
            onUnityMessage: (handler) {
              final coordinates = handler.toString().split(",");
              widget.shoot(
                int.parse(coordinates[0]),
                int.parse(coordinates[1]),
              );
            },
            onUnityCreated: (controller) async {
              setState(() {
                _unityWidgetController = controller;

                // _gameRepository.addListener(() {
                //   _unityWidgetController.postMessage(
                //     'GameManager',
                //     'Notify',
                //     _gameRepository.board.toString(),
                //   );
                // });
              });
            },
          );
  }

  Widget _cell(
    BuildContext context,
    int x,
    int y,
    String ownerId,
    String shooterId,
  ) {
    final shot = widget.game.shots.firstWhereOrNull(
      (s) => s.x == x && s.y == y && s.shooterId == shooterId,
    );
    final isShot = shot != null;
    final isHit = shot?.hit ?? false;
    final hasFog = ownerId != myId;
    final hasShip = widget.game.ships.any(
      (ship) => ship.x == x && ship.y == y && ship.ownerId == ownerId,
    );

    Color? color;
    if (isHit) {
      color = Colors.red;
    } else if (hasShip) {
      color = hasFog ? Colors.blueGrey : Colors.green.shade800;
    } else if (isShot) {
      color = Colors.blue;
    } else {
      color = hasFog ? Colors.blueGrey : Colors.blue;
    }

    return InkWell(
      onTap: hasFog && !isShot && widget.game.currentPlayerId == myId
          ? () {
              widget.shoot(x, y);
            }
          : null,
      child: Container(
        width: 24,
        height: 24,
        color: color,
        margin: const EdgeInsets.all(8),
      ),
    );
  }
}
