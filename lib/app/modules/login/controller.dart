import 'package:lime_english/app/data/models/user.dart';
import 'package:lime_english/app/data/services/app_config/service.dart';
import 'package:lime_english/app/data/services/auth/service.dart';
import 'package:lime_english/app/modules/login/repository.dart';
import 'package:lime_english/core/utils/functions/verify_response.dart';
import 'package:lime_english/routes/pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository repository;
  LoginController(this.repository);
  final user = User().obs;
  final isEmail = false.obs;
  AppConfigService? config;
  AuthService? auth;
  final darkMode = false.obs;

  @override
  void onInit() async {
    config = Get.find<AppConfigService>();
    auth = Get.find<AuthService>();
    darkMode.value = config!.darkMode();
    await reauth();
    super.onInit();
  }

  changeTheme() {
    config!.changeDarkMode(Get.isDarkMode ? false : true);
    darkMode.value = config!.darkMode();
  }

  reauth() async {
    await Future.delayed(Duration.zero, () {
      if (config!.isLogged()) {
        Get.offNamed(Routes.home);
      }
    });
  }

  login() async {
    final _ = await auth!.login(user.value.email);
    if (verifyresponse(_)) {
      Get.showSnackbar(GetSnackBar(
        message: _.message,
        duration: const Duration(seconds: 2),
      ));
    } else {
      config!.changeIsLogged(true);
      Get.offNamed(Routes.home);
    }
  }

  onChangeEmail(_) {
    GetUtils.isEmail(_) ? isEmail.value = true : isEmail.value = false;

    user.update((val) => val!.email = _);
  }

  onSavedEmail(_) => user.update((val) => val!.email = _);
  onValidateEmail(_) => GetUtils.isEmail(_) ? null : 'Insira um email válido';
}
