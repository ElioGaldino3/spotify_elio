import 'package:flutter_modular/flutter_modular.dart';
import 'package:spotify_elio/app/modules/auth/splash_page.dart';

import 'auth_controller.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AuthController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, __) => SplashPage(),
        ),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
