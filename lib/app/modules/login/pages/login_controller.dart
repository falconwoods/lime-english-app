import 'package:lime_english/app/data/models/user.dart';
import 'package:lime_english/app/data/services/config_service.dart';
import 'package:lime_english/app/data/services/auth_service.dart';
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

  // onChangeEmail(_) {
  //   GetUtils.isEmail(_) ? isEmail.value = true : isEmail.value = false;

  //   user.update((val) => val!.email = _);
  // }

  // onSavedEmail(_) => user.update((val) => val!.email = _);
  // onValidateEmail(_) => GetUtils.isEmail(_) ? null : 'Insira um email válido';
}
