import 'package:lime_english/app/services/config_service.dart';
import 'package:lime_english/app/services/auth_service.dart';
import 'package:get/get.dart';

class EpisodeController extends GetxController
    with GetTickerProviderStateMixin {
  AppConfigService? config;
  late final AuthService auth;
  late final int episodeId;

  @override
  void onInit() async {
    config = Get.find<AppConfigService>();
    auth = Get.find<AuthService>();
    episodeId = Get.arguments as int;
    Get.log('episodeId: $episodeId');
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    Get.log('EpisodeController onClose');
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
