import 'package:lime_english/app/data/models/user.dart';
import 'package:lime_english/app/services/config_service.dart';
import 'package:lime_english/app/services/auth_service.dart';
import 'package:lime_english/core/utils/functions/verify_response.dart';
import 'package:lime_english/routes/pages.dart';
import 'package:get/get.dart';

class EpisodeController extends GetxController
    with GetSingleTickerProviderStateMixin {
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
