import 'package:lime_english/app/data/app_translations.dart';
import 'package:lime_english/app/data/services/config_service.dart';
import 'package:lime_english/app/data/services/auth_service.dart';
import 'package:lime_english/app/modules/home/binding.dart';
import 'package:lime_english/app/modules/login/binding.dart';
import 'package:lime_english/core/theme/light_theme.dart';
import 'package:lime_english/core/utils/app_ui.dart';
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
  await dotenv.load();

  // load translations
  final appTrans = await AppTranslations().load();

  // register dependencies
  await Get.putAsync(() => AppConfigService().init());
  await Get.putAsync(() => AuthService().init());

  // TODO: update theme when it changed
  AppUI.setThemeData(lightTheme);

  runApp(GetMaterialApp(
    locale: Get.deviceLocale,
    translations: appTrans,
    initialBinding: HomeBinding(),
    initialRoute: Routes.HOME,
    getPages: AppPages.pages,
    theme: lightTheme,
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.light,
    debugShowCheckedModeBanner: false,
  ));
}
