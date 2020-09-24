import 'package:dio/dio.dart';
import 'package:spotify_elio/app/modules/login/login_module.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:spotify_elio/app/app_widget.dart';

import 'modules/home/home_module.dart';
import 'shared/controllers/auth_controller.dart';
import 'shared/datasources/get_storage_datasource_impl.dart';
import 'shared/repositories/storage_impl.dart';
import 'pages/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        $GetStorageDatasourceImpl,
        $StorageImpl,
        $AuthController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, __) => SplashPage(),
        ),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/login', module: LoginModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
