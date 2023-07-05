import 'dart:math';

import 'package:battleship_client/battleship_client.dart';
import 'package:flutter/widgets.dart';
import 'package:battleship_ar_flutter/grid.dart';

class GameRepository with ChangeNotifier {
  GameRepository({required this.client});

  Client client;
}
