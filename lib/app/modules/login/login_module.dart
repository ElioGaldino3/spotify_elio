import 'package:flutter_modular/flutter_modular.dart';
import 'package:spotify_elio/app/modules/login/login_controller.dart';
import 'package:spotify_elio/app/modules/login/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $LoginController,
      ];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter(Modular.initialRoute, child: (_, __) => LoginPage())];

  static Inject get to => Inject<LoginModule>.of();
}
