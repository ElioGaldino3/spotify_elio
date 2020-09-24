// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(i<IStorage>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$_spotifyTokenAtom = Atom(name: '_LoginControllerBase._spotifyToken');

  @override
  SpotifyToken get _spotifyToken {
    _$_spotifyTokenAtom.reportRead();
    return super._spotifyToken;
  }

  @override
  set _spotifyToken(SpotifyToken value) {
    _$_spotifyTokenAtom.reportWrite(value, super._spotifyToken, () {
      super._spotifyToken = value;
    });
  }

  final _$setSpotifyTokenAsyncAction =
      AsyncAction('_LoginControllerBase.setSpotifyToken');

  @override
  Future<dynamic> setSpotifyToken() {
    return _$setSpotifyTokenAsyncAction.run(() => super.setSpotifyToken());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
