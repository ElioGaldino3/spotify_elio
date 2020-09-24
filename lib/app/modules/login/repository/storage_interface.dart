import 'package:spotify_elio/app/shared/models/spotify_token.dart';

abstract class IStorage {
  Future saveToken(SpotifyToken spotifyToken);
}
