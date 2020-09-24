import 'package:flutter_modular/flutter_modular.dart';
import 'package:spotify_elio/app/modules/auth/splash_page.dart';

import 'auth_controller.dart';
import 'datasources/get_storage_datasource_impl.dart';
import 'repository/datasource_interface/storage_datasource_interface.dart';
import 'repository/storage_impl.dart';
import 'repository/storage_interface.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IStorageDatasource>((i) => GetStorageDatasourceImpl()),
        Bind<IStorage>((i) => StorageImpl(i.get())),
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
