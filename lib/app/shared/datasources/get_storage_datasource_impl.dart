import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spotify_elio/app/shared/models/spotify_token.dart';
import 'package:spotify_elio/app/shared/repositories/datasource_interface/storage_datasource_interface.dart';

part 'get_storage_datasource_impl.g.dart';
@Injectable()
class GetStorageDatasourceImpl implements IStorageDatasource {
  final box = GetStorage();

  @override
  Future saveToken(SpotifyToken spotifyToken) async {
    try {
      box.write('token', spotifyToken.toMap());
    } catch (_) {}
  }

  @override
  Future<SpotifyToken> getToken() async {
    try {
      var tokenMap = await box.read('token');

      return tokenMap != null ? SpotifyToken.fromMap(tokenMap) : null;
    } catch (_) {
      return null;
    }
  }
}
