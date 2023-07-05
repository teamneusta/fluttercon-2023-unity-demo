/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'game_state.dart' as _i3;
import 'join_game_cmd.dart' as _i4;
import 'lobby_state.dart' as _i5;
import 'msg_error.dart' as _i6;
import 'msg_info.dart' as _i7;
import 'new_game_cmd.dart' as _i8;
import 'player.dart' as _i9;
import 'ship.dart' as _i10;
import 'shoot_cmd.dart' as _i11;
import 'shot.dart' as _i12;
import 'protocol.dart' as _i13;
export 'game_state.dart';
export 'join_game_cmd.dart';
export 'lobby_state.dart';
export 'msg_error.dart';
export 'msg_info.dart';
export 'new_game_cmd.dart';
export 'player.dart';
export 'ship.dart';
export 'shoot_cmd.dart';
export 'shot.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final targetDatabaseDefinition = _i2.DatabaseDefinition(
      tables: [..._i2.Protocol.targetDatabaseDefinition.tables]);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i3.GameState) {
      return _i3.GameState.fromJson(data, this) as T;
    }
    if (t == _i4.JoinGameCommand) {
      return _i4.JoinGameCommand.fromJson(data, this) as T;
    }
    if (t == _i5.LobbyState) {
      return _i5.LobbyState.fromJson(data, this) as T;
    }
    if (t == _i6.ErrorMessage) {
      return _i6.ErrorMessage.fromJson(data, this) as T;
    }
    if (t == _i7.InfoMessage) {
      return _i7.InfoMessage.fromJson(data, this) as T;
    }
    if (t == _i8.NewGameCommand) {
      return _i8.NewGameCommand.fromJson(data, this) as T;
    }
    if (t == _i9.Player) {
      return _i9.Player.fromJson(data, this) as T;
    }
    if (t == _i10.Ship) {
      return _i10.Ship.fromJson(data, this) as T;
    }
    if (t == _i11.ShootCommand) {
      return _i11.ShootCommand.fromJson(data, this) as T;
    }
    if (t == _i12.Shot) {
      return _i12.Shot.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.GameState?>()) {
      return (data != null ? _i3.GameState.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.JoinGameCommand?>()) {
      return (data != null ? _i4.JoinGameCommand.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.LobbyState?>()) {
      return (data != null ? _i5.LobbyState.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.ErrorMessage?>()) {
      return (data != null ? _i6.ErrorMessage.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.InfoMessage?>()) {
      return (data != null ? _i7.InfoMessage.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.NewGameCommand?>()) {
      return (data != null ? _i8.NewGameCommand.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i9.Player?>()) {
      return (data != null ? _i9.Player.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.Ship?>()) {
      return (data != null ? _i10.Ship.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i11.ShootCommand?>()) {
      return (data != null ? _i11.ShootCommand.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i12.Shot?>()) {
      return (data != null ? _i12.Shot.fromJson(data, this) : null) as T;
    }
    if (t == List<_i13.Player>) {
      return (data as List).map((e) => deserialize<_i13.Player>(e)).toList()
          as dynamic;
    }
    if (t == List<_i13.Ship>) {
      return (data as List).map((e) => deserialize<_i13.Ship>(e)).toList()
          as dynamic;
    }
    if (t == List<_i13.Shot>) {
      return (data as List).map((e) => deserialize<_i13.Shot>(e)).toList()
          as dynamic;
    }
    if (t == List<_i13.GameState>) {
      return (data as List).map((e) => deserialize<_i13.GameState>(e)).toList()
          as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.GameState) {
      return 'GameState';
    }
    if (data is _i4.JoinGameCommand) {
      return 'JoinGameCommand';
    }
    if (data is _i5.LobbyState) {
      return 'LobbyState';
    }
    if (data is _i6.ErrorMessage) {
      return 'ErrorMessage';
    }
    if (data is _i7.InfoMessage) {
      return 'InfoMessage';
    }
    if (data is _i8.NewGameCommand) {
      return 'NewGameCommand';
    }
    if (data is _i9.Player) {
      return 'Player';
    }
    if (data is _i10.Ship) {
      return 'Ship';
    }
    if (data is _i11.ShootCommand) {
      return 'ShootCommand';
    }
    if (data is _i12.Shot) {
      return 'Shot';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'GameState') {
      return deserialize<_i3.GameState>(data['data']);
    }
    if (data['className'] == 'JoinGameCommand') {
      return deserialize<_i4.JoinGameCommand>(data['data']);
    }
    if (data['className'] == 'LobbyState') {
      return deserialize<_i5.LobbyState>(data['data']);
    }
    if (data['className'] == 'ErrorMessage') {
      return deserialize<_i6.ErrorMessage>(data['data']);
    }
    if (data['className'] == 'InfoMessage') {
      return deserialize<_i7.InfoMessage>(data['data']);
    }
    if (data['className'] == 'NewGameCommand') {
      return deserialize<_i8.NewGameCommand>(data['data']);
    }
    if (data['className'] == 'Player') {
      return deserialize<_i9.Player>(data['data']);
    }
    if (data['className'] == 'Ship') {
      return deserialize<_i10.Ship>(data['data']);
    }
    if (data['className'] == 'ShootCommand') {
      return deserialize<_i11.ShootCommand>(data['data']);
    }
    if (data['className'] == 'Shot') {
      return deserialize<_i12.Shot>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    return null;
  }

  @override
  _i2.DatabaseDefinition getTargetDatabaseDefinition() =>
      targetDatabaseDefinition;
}
