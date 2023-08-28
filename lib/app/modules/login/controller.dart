import 'package:lime_english/app/data/models/user.dart';
import 'package:lime_english/app/services/config_service.dart';
import 'package:lime_english/app/services/auth_service.dart';
import 'package:lime_english/core/utils/functions/verify_response.dart';
import 'package:lime_english/routes/pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  AppConfigService? config;
  late final AuthService auth;

  @override
  void onInit() async {
    config = Get.find<AppConfigService>();
    auth = Get.find<AuthService>();
    super.onInit();
  }

  login() async {
    String username = '';
    String password = '';
    final res = await auth.login({username, password});
    if (res.isOk) {
      // Get.offNamed(Routes.HOME);
    } else {
      // password error?
    }
  }
}
