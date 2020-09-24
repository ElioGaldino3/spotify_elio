// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$playlistsAtom = Atom(name: '_HomeControllerBase.playlists');

  @override
  List<PlaylistModel> get playlists {
    _$playlistsAtom.reportRead();
    return super.playlists;
  }

  @override
  set playlists(List<PlaylistModel> value) {
    _$playlistsAtom.reportWrite(value, super.playlists, () {
      super.playlists = value;
    });
  }

  final _$getPlaylistsAsyncAction =
      AsyncAction('_HomeControllerBase.getPlaylists');

  @override
  Future<dynamic> getPlaylists() {
    return _$getPlaylistsAsyncAction.run(() => super.getPlaylists());
  }

  @override
  String toString() {
    return '''
playlists: ${playlists}
    ''';
  }
}
