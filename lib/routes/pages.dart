import 'package:lime_english/app/modules/animal_details/binding.dart';
import 'package:lime_english/app/modules/animal_details/page.dart';
import 'package:lime_english/app/modules/home/binding.dart';
import 'package:lime_english/app/modules/home/page.dart';
import 'package:lime_english/app/modules/login/binding.dart';
import 'package:lime_english/app/modules/login/page.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.learn,
        page: () => const HomePage(),
        bindings: [HomeBinding()]),
    GetPage(
        name: Routes.login,
        page: () => LoginPage(),
        bindings: [LoginBinding()]),
  ];
}
