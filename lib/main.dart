import 'package:lime_english/app/data/app_translations.dart';
import 'package:lime_english/app/services/config_service.dart';
import 'package:lime_english/app/services/auth_service.dart';
import 'package:lime_english/app/services/db_service.dart';
import 'package:lime_english/app/services/dic_service.dart';
import 'package:lime_english/app/services/file_service.dart';
import 'package:lime_english/app/modules/home/binding.dart';
import 'package:lime_english/app/services/player/player_service.dart';
import 'package:lime_english/app/services/pronounce_service.dart';
import 'package:lime_english/core/theme/light_theme.dart';
import 'package:lime_english/core/utils/app_ui.dart';
import 'package:lime_english/routes/app_pages.dart';
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
  await Get.putAsync(() => FileService().init());
  await Get.putAsync(() => DBService().init());
  await Get.putAsync(() => DicService().init());
  await Get.putAsync(() => PlayerService().init());
  await Get.putAsync(() => PronounceService().init());

  // TODO: update theme when it changed
  AppUI.setThemeData(appLightTheme);

  runApp(GetMaterialApp(
    locale: Get.deviceLocale,
    fallbackLocale: const Locale('en', 'US'),
    translations: appTrans,
    initialBinding: HomeBinding(),
    initialRoute: Routes.HOME,
    getPages: AppPages.pages,
    theme: appLightTheme,
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.light,
    debugShowCheckedModeBanner: false,
  ));
}
