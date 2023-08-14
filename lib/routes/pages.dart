import 'package:lime_english/app/modules/episode/binding.dart';
import 'package:lime_english/app/modules/episode/page.dart';
import 'package:lime_english/app/modules/home/binding.dart';
import 'package:lime_english/app/modules/home/page.dart';
import 'package:lime_english/app/modules/login/binding.dart';
import 'package:lime_english/app/modules/login/page.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/login/pages/password_login_page.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.LOGIN, page: () => const LoginPage()),
    GetPage(
        name: Routes.LOGIN_PASSWORD,
        page: () => PasswordLoginPage(),
        bindings: [LoginBinding()]),
    GetPage(
        name: Routes.HOME, page: () => HomePage(), bindings: [HomeBinding()]),
    GetPage(
        name: Routes.EPISODE,
        page: () => EpisodePage(),
        bindings: [EpisodeBinding()]),
  ];
}
