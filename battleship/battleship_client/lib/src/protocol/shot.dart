/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Shot extends _i1.SerializableEntity {
  Shot({
    required this.x,
    required this.y,
    required this.shooterId,
    required this.hit,
  });

  factory Shot.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Shot(
      x: serializationManager.deserialize<int>(jsonSerialization['x']),
      y: serializationManager.deserialize<int>(jsonSerialization['y']),
      shooterId: serializationManager
          .deserialize<String>(jsonSerialization['shooterId']),
      hit: serializationManager.deserialize<bool>(jsonSerialization['hit']),
    );
  }

  int x;

  int y;

  String shooterId;

  bool hit;

  @override
  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
      'shooterId': shooterId,
      'hit': hit,
    };
  }
}
