
import 'package:spotify_elio/app/shared/models/spotify_token.dart';

import 'datasource_interface/storage_datasource_interface.dart';
import 'storage_interface.dart';

class StorageImpl implements IStorage {
  final IStorageDatasource _datasource;

  StorageImpl(this._datasource);

  @override
  Future<SpotifyToken> getToken() async {
    return await _datasource.getToken();
  }
}
