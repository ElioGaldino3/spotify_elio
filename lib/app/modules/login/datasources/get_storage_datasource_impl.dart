import 'package:get_storage/get_storage.dart';
import 'package:spotify_elio/app/modules/login/repository/datasource_interface/storage_datasource_interface.dart';
import 'package:spotify_elio/app/shared/models/spotify_token.dart';

class GetStorageDatasourceImpl implements IStorageDatasource {
  final box = GetStorage();
  @override
  Future saveToken(SpotifyToken spotifyToken) async {
    try {
      box.write('token', spotifyToken.toMap());
    } catch (_) {}
  }
}
