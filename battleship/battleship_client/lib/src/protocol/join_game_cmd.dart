/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class JoinGameCommand extends _i1.SerializableEntity {
  JoinGameCommand({
    required this.pin,
    required this.player,
  });

  factory JoinGameCommand.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return JoinGameCommand(
      pin: serializationManager.deserialize<String>(jsonSerialization['pin']),
      player: serializationManager
          .deserialize<_i2.Player>(jsonSerialization['player']),
    );
  }

  String pin;

  _i2.Player player;

  @override
  Map<String, dynamic> toJson() {
    return {
      'pin': pin,
      'player': player,
    };
  }
}
