/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Ship extends _i1.SerializableEntity {
  Ship({
    required this.name,
    required this.ownerId,
    required this.size,
    required this.x,
    required this.y,
    required this.directionAsInt,
  });

  factory Ship.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Ship(
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      ownerId: serializationManager
          .deserialize<String>(jsonSerialization['ownerId']),
      size: serializationManager.deserialize<int>(jsonSerialization['size']),
      x: serializationManager.deserialize<int>(jsonSerialization['x']),
      y: serializationManager.deserialize<int>(jsonSerialization['y']),
      directionAsInt: serializationManager
          .deserialize<int>(jsonSerialization['directionAsInt']),
    );
  }

  String name;

  String ownerId;

  int size;

  int x;

  int y;

  int directionAsInt;

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ownerId': ownerId,
      'size': size,
      'x': x,
      'y': y,
      'directionAsInt': directionAsInt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'name': name,
      'ownerId': ownerId,
      'size': size,
      'x': x,
      'y': y,
      'directionAsInt': directionAsInt,
    };
  }
}
