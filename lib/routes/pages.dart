import 'package:lime_english/app/modules/login/binding.dart';
import 'package:lime_english/app/modules/login/login_password.dart';
import 'package:lime_english/app/modules/login/page.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginPage(),
        bindings: [LoginBinding()]),
  ];
}
