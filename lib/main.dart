import 'package:lime_english/app/data/services/app_config_service.dart';
import 'package:lime_english/app/data/services/auth_service.dart';
import 'package:lime_english/app/modules/login/binding.dart';
import 'package:lime_english/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // init system and plugins
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // load env
  await dotenv.load(fileName: '.env');

  // register dependencies
  await Get.putAsync(() => AppConfigService().init());
  await Get.putAsync(() => AuthService().init());

  runApp(GetMaterialApp(
    initialBinding: LoginBinding(),
    initialRoute: Routes.login,
    getPages: AppPages.pages,
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));
}
