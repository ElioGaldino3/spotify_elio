import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:spotify_elio/app/shared/models/spotify_token.dart';
import 'package:spotify_elio/app/shared/repositories/storage_interface.dart';
import 'package:spotify_elio/app/shared/enums/auth_enum.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IStorage storage;
  final Dio dio;

  _AuthControllerBase(this.storage, this.dio) {
    checkToken();
  }

  @observable
  AuthStatus authStatus = AuthStatus.LOADING;

  @observable
  SpotifyToken spotifyToken;

  @action
  void changeAuthStatus(AuthStatus authStatus) {
    this.authStatus = authStatus;
  }

  Future checkToken() async {
    var token = await storage.getToken();

    if (token != null) {
      this.spotifyToken = token;
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            var newOptions = options;
            if (!options.path.contains('token')) {
              newOptions.headers.addAll({
                'Authorization':
                    'Bearer ${Modular.get<AuthController>().spotifyToken.accessToken}'
              });
            }
            return newOptions;
          },
          onError: (DioError e) async {

            final clientId = DotEnv().env['SPOTIFY_CLIENT_ID'];
            final clientSecret = DotEnv().env['SPOTIFY_CLIENT_SECRET'];
            if (e.response.statusCode == 401) {
              var result = await dio.post(
                  'https://accounts.spotify.com/api/token',
                  data: {
                    'grant_type': 'refresh_token',
                    'refresh_token': token.refreshToken,
                    'client_id': clientId,
                    'client_secret': clientSecret,
                  },
                  options: Options(
                      contentType: 'application/x-www-form-urlencoded'));
              var newToken = SpotifyToken(
                  accessToken: result.data['access_token'],
                  refreshToken: token.refreshToken);
              storage.saveToken(newToken);
              this.spotifyToken = newToken;
            }
          },
        ),
      );
      authStatus = AuthStatus.LOGGED;
    } else {
      authStatus = AuthStatus.LOGOUT;
    }
  }
}
