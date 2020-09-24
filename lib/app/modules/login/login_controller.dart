import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spotify_elio/app/modules/auth/auth_controller.dart';
import 'package:spotify_elio/app/shared/repositories/storage_interface.dart';
import 'package:spotify_elio/app/shared/models/spotify_token.dart';
import 'package:spotify_elio/app/shared/utils/auth.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final IStorage storage;

  @observable
  SpotifyToken _spotifyToken;

  _LoginControllerBase(this.storage);

  @action
  Future setSpotifyToken() async {
    final result = await authenticateSpotify();

    _spotifyToken = result;
    storage.saveToken(result);
    Modular.get<AuthController>().checkToken();
    Modular.to.pushNamed('/home');
  }
}
