import 'package:lime_english/app/modules/learn/binding.dart';
import 'package:lime_english/app/modules/learn/page.dart';
import 'package:lime_english/app/modules/login/binding.dart';
import 'package:lime_english/app/modules/login/page.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/login/pages/password_login_page.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.LOGIN, page: () => const LoginPage(), bindings: []),
    GetPage(
        name: Routes.LOGIN_PASSWORD,
        page: () => PasswordLoginPage(),
        bindings: [LoginBinding()]),
    GetPage(name: Routes.LEARN, page: () => LearnPage(), bindings: []),
  ];
}
