import 'package:get_storage/get_storage.dart';
import 'package:spotify_elio/app/shared/models/spotify_token.dart';

import '../repository/datasource_interface/storage_datasource_interface.dart';

class GetStorageDatasourceImpl implements IStorageDatasource {
  final box = GetStorage();
  @override
  Future<SpotifyToken> getToken() async {
    try {
      var tokenMap = await box.read('token');

      return tokenMap != null ? SpotifyToken.fromMap(tokenMap) : null;
    } catch (_) {}
  }
}
