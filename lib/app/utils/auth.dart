import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

Future authenticate() async {
  final clientId = 'fbd81941e1704aa3b53b0217e4342619';
  final clientSecret = '0278034a56df45028c6116d924be2e77';
  final redirectUri = 'foobar';
  final scopes = 'user-read-private user-read-email ugc-image-upload';

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

  print(dioResult.data['refresh_token']);

  final dioResult2 = await dio.post('https://accounts.spotify.com/api/token',
      data: {
        'grant_type': 'refresh_token',
        'refresh_token': dioResult.data['refresh_token'],
        'client_id': clientId,
        'client_secret': clientSecret
      },
      options: Options(contentType: 'application/x-www-form-urlencoded'));

  return dioResult2;
}
