import 'package:dio/dio.dart';
import 'package:spotify_elio/app/modules/login/login_module.dart';

import 'modules/auth/auth_controller.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:spotify_elio/app/app_widget.dart';

import 'modules/login/login_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        $AuthController,
        $LoginController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          module: AuthModule(),
        ),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/login', module: LoginModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
