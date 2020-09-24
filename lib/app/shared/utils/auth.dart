import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:spotify_elio/app/shared/models/spotify_token.dart';

Future authenticateSpotify() async {
  final clientId = DotEnv().env['SPOTIFY_CLIENT_ID'];
  final clientSecret = DotEnv().env['SPOTIFY_CLIENT_SECRET'];
  final redirectUri = 'foobar';
  final scopes = 'user-read-private user-read-email';

  final url = Uri.https('accounts.spotify.com', 'authorize', {
    'response_type': 'code',
    'client_id': clientId,
    'redirect_uri': '$redirectUri:/',
    'scope': scopes,
  });

  final result = await FlutterWebAuth.authenticate(
      url: url.toString(), callbackUrlScheme: redirectUri);

  final code = Uri.parse(result).queryParameters['code'];

  final dio = Dio();

  final dioResult = await dio.post('https://accounts.spotify.com/api/token',
      data: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': '$redirectUri:/',
        'client_id': clientId,
        'client_secret': clientSecret
      },
      options: Options(contentType: 'application/x-www-form-urlencoded'));


  return SpotifyToken.fromMap(dioResult.data);
}
