import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spotify_elio/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';

void main() async {
  await DotEnv().load('.env');
  await GetStorage.init();
  runApp(ModularApp(module: AppModule()));
}
