/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'game_state.dart' as _i2;
import 'join_game_cmd.dart' as _i3;
import 'lobby_state.dart' as _i4;
import 'msg_error.dart' as _i5;
import 'msg_info.dart' as _i6;
import 'new_game_cmd.dart' as _i7;
import 'player.dart' as _i8;
import 'ship.dart' as _i9;
import 'shoot_cmd.dart' as _i10;
import 'shot.dart' as _i11;
import 'protocol.dart' as _i12;
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
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.GameState) {
      return _i2.GameState.fromJson(data, this) as T;
    }
    if (t == _i3.JoinGameCommand) {
      return _i3.JoinGameCommand.fromJson(data, this) as T;
    }
    if (t == _i4.LobbyState) {
      return _i4.LobbyState.fromJson(data, this) as T;
    }
    if (t == _i5.ErrorMessage) {
      return _i5.ErrorMessage.fromJson(data, this) as T;
    }
    if (t == _i6.InfoMessage) {
      return _i6.InfoMessage.fromJson(data, this) as T;
    }
    if (t == _i7.NewGameCommand) {
      return _i7.NewGameCommand.fromJson(data, this) as T;
    }
    if (t == _i8.Player) {
      return _i8.Player.fromJson(data, this) as T;
    }
    if (t == _i9.Ship) {
      return _i9.Ship.fromJson(data, this) as T;
    }
    if (t == _i10.ShootCommand) {
      return _i10.ShootCommand.fromJson(data, this) as T;
    }
    if (t == _i11.Shot) {
      return _i11.Shot.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.GameState?>()) {
      return (data != null ? _i2.GameState.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.JoinGameCommand?>()) {
      return (data != null ? _i3.JoinGameCommand.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i4.LobbyState?>()) {
      return (data != null ? _i4.LobbyState.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.ErrorMessage?>()) {
      return (data != null ? _i5.ErrorMessage.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.InfoMessage?>()) {
      return (data != null ? _i6.InfoMessage.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.NewGameCommand?>()) {
      return (data != null ? _i7.NewGameCommand.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i8.Player?>()) {
      return (data != null ? _i8.Player.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.Ship?>()) {
      return (data != null ? _i9.Ship.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.ShootCommand?>()) {
      return (data != null ? _i10.ShootCommand.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i11.Shot?>()) {
      return (data != null ? _i11.Shot.fromJson(data, this) : null) as T;
    }
    if (t == List<_i12.Player>) {
      return (data as List).map((e) => deserialize<_i12.Player>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.Ship>) {
      return (data as List).map((e) => deserialize<_i12.Ship>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.Shot>) {
      return (data as List).map((e) => deserialize<_i12.Shot>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.GameState>) {
      return (data as List).map((e) => deserialize<_i12.GameState>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.GameState) {
      return 'GameState';
    }
    if (data is _i3.JoinGameCommand) {
      return 'JoinGameCommand';
    }
    if (data is _i4.LobbyState) {
      return 'LobbyState';
    }
    if (data is _i5.ErrorMessage) {
      return 'ErrorMessage';
    }
    if (data is _i6.InfoMessage) {
      return 'InfoMessage';
    }
    if (data is _i7.NewGameCommand) {
      return 'NewGameCommand';
    }
    if (data is _i8.Player) {
      return 'Player';
    }
    if (data is _i9.Ship) {
      return 'Ship';
    }
    if (data is _i10.ShootCommand) {
      return 'ShootCommand';
    }
    if (data is _i11.Shot) {
      return 'Shot';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'GameState') {
      return deserialize<_i2.GameState>(data['data']);
    }
    if (data['className'] == 'JoinGameCommand') {
      return deserialize<_i3.JoinGameCommand>(data['data']);
    }
    if (data['className'] == 'LobbyState') {
      return deserialize<_i4.LobbyState>(data['data']);
    }
    if (data['className'] == 'ErrorMessage') {
      return deserialize<_i5.ErrorMessage>(data['data']);
    }
    if (data['className'] == 'InfoMessage') {
      return deserialize<_i6.InfoMessage>(data['data']);
    }
    if (data['className'] == 'NewGameCommand') {
      return deserialize<_i7.NewGameCommand>(data['data']);
    }
    if (data['className'] == 'Player') {
      return deserialize<_i8.Player>(data['data']);
    }
    if (data['className'] == 'Ship') {
      return deserialize<_i9.Ship>(data['data']);
    }
    if (data['className'] == 'ShootCommand') {
      return deserialize<_i10.ShootCommand>(data['data']);
    }
    if (data['className'] == 'Shot') {
      return deserialize<_i11.Shot>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
