/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class GameState extends _i1.SerializableEntity {
  GameState({
    required this.pin,
    required this.width,
    required this.height,
    required this.players,
    required this.ships,
    required this.shots,
    this.currentPlayerId,
    this.winnerId,
  });

  factory GameState.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return GameState(
      pin: serializationManager.deserialize<String>(jsonSerialization['pin']),
      width: serializationManager.deserialize<int>(jsonSerialization['width']),
      height:
          serializationManager.deserialize<int>(jsonSerialization['height']),
      players: serializationManager
          .deserialize<List<_i2.Player>>(jsonSerialization['players']),
      ships: serializationManager
          .deserialize<List<_i2.Ship>>(jsonSerialization['ships']),
      shots: serializationManager
          .deserialize<List<_i2.Shot>>(jsonSerialization['shots']),
      currentPlayerId: serializationManager
          .deserialize<String?>(jsonSerialization['currentPlayerId']),
      winnerId: serializationManager
          .deserialize<String?>(jsonSerialization['winnerId']),
    );
  }

  String pin;

  int width;

  int height;

  List<_i2.Player> players;

  List<_i2.Ship> ships;

  List<_i2.Shot> shots;

  String? currentPlayerId;

  String? winnerId;

  @override
  Map<String, dynamic> toJson() {
    return {
      'pin': pin,
      'width': width,
      'height': height,
      'players': players,
      'ships': ships,
      'shots': shots,
      'currentPlayerId': currentPlayerId,
      'winnerId': winnerId,
    };
  }
}
