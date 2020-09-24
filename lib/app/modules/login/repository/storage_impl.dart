import 'package:spotify_elio/app/modules/login/repository/datasource_interface/storage_datasource_interface.dart';
import 'package:spotify_elio/app/modules/login/repository/storage_interface.dart';
import 'package:spotify_elio/app/shared/models/spotify_token.dart';

class StorageImpl implements IStorage {
  final IStorageDatasource _datasource;

  StorageImpl(this._datasource);

  @override
  Future saveToken(SpotifyToken spotifyToken) async {
    return await _datasource.saveToken(spotifyToken);
  }
}
