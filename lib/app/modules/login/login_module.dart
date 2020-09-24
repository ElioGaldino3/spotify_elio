import 'package:flutter_modular/flutter_modular.dart';
import 'package:spotify_elio/app/modules/login/datasources/get_storage_datasource_impl.dart';
import 'package:spotify_elio/app/modules/login/login_controller.dart';
import 'package:spotify_elio/app/modules/login/login_page.dart';
import 'package:spotify_elio/app/modules/login/repository/datasource_interface/storage_datasource_interface.dart';
import 'package:spotify_elio/app/modules/login/repository/storage_impl.dart';
import 'package:spotify_elio/app/modules/login/repository/storage_interface.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IStorageDatasource>((i) => GetStorageDatasourceImpl()),
        Bind<IStorage>((i) => StorageImpl(i.get())),
        $LoginController,
      ];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter(Modular.initialRoute, child: (_, __) => LoginPage())];

  static Inject get to => Inject<LoginModule>.of();
}
