import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import './repository/storage_interface.dart';
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

  @action
  void changeAuthStatus(AuthStatus authStatus) {
    this.authStatus = authStatus;
  }

  Future checkToken() async {
    var token = await storage.getToken();

    if (token != null) {
      dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        var newOptions = options;
        newOptions.headers
            .addAll({'Authorization': 'Bearer ${token.accessToken}'});
        return newOptions;
      }));
      print(token.accessToken);
      authStatus = AuthStatus.LOGGED;
    } else {
      authStatus = AuthStatus.LOGOUT;
    }
  }
}
