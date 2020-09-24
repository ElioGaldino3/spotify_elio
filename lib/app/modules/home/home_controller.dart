import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spotify_elio/app/shared/models/spotify_playlist.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase() {
    getPlaylists();
  }

  @observable
  List<PlaylistModel> playlists = <PlaylistModel>[];

  @action
  Future getPlaylists() async {
    var url = 'https://api.spotify.com/v1/me/playlists?limit=10';

    var result = await Modular.get<Dio>()
        .get(url, options: Options(contentType: 'application/json'));

    var tempPlaylists = <PlaylistModel>[];

    for (var item in result.data['items']) {
      tempPlaylists.add(PlaylistModel.fromJson(item));
    }

    playlists = tempPlaylists;
  }
}
