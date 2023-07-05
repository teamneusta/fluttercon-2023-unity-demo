/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class ShootCommand extends _i1.SerializableEntity {
  ShootCommand({
    required this.pin,
    required this.shooterId,
    required this.x,
    required this.y,
  });

  factory ShootCommand.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ShootCommand(
      pin: serializationManager.deserialize<String>(jsonSerialization['pin']),
      shooterId: serializationManager
          .deserialize<String>(jsonSerialization['shooterId']),
      x: serializationManager.deserialize<int>(jsonSerialization['x']),
      y: serializationManager.deserialize<int>(jsonSerialization['y']),
    );
  }

  String pin;

  String shooterId;

  int x;

  int y;

  @override
  Map<String, dynamic> toJson() {
    return {
      'pin': pin,
      'shooterId': shooterId,
      'x': x,
      'y': y,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'pin': pin,
      'shooterId': shooterId,
      'x': x,
      'y': y,
    };
  }
}
