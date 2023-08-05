import 'package:lime_english/app/data/services/app_config/service.dart';
import 'package:lime_english/app/data/services/auth/service.dart';
import 'package:lime_english/app/modules/login/binding.dart';
import 'package:lime_english/app/modules/login/page.dart';
import 'package:lime_english/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => AppConfigService().init());
  await Get.putAsync(() => AuthService().init());

  runApp(GetMaterialApp(
    initialBinding: LoginBinding(),
    initialRoute: Routes.LOGIN,
    getPages: AppPages.pages,
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));
}
