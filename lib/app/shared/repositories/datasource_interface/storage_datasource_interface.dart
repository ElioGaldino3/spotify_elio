import 'package:spotify_elio/app/shared/models/spotify_token.dart';

abstract class IStorageDatasource {
  Future saveToken(SpotifyToken spotifyToken);
  Future<SpotifyToken> getToken();
}
