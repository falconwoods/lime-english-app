import 'package:lime_english/app/data/models/api_res.dart';
import 'package:lime_english/app/data/models/user.dart';
import 'package:lime_english/app/data/provider/app_api.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/data/services/config_service.dart';
import 'package:lime_english/core/values/consts.dart';

class AuthService extends GetxService {
  late final AppApi api;
  late final AppConfigService cfgService;
  final user = Rx<User?>(null);

  Future<AuthService> init() async {
    api = AppApi();
    cfgService = Get.find<AppConfigService>();
    return this;
  }

  Future<ApiResponse> login(arg) async {
    ApiResponse res = await api.postAuth(API_LOGIN, arg);
    User.fromJson(res.data);
    if (res.isOk) {
      cfgService.userToken = res.data['token'];
      user.value = User.fromJson(res.data);
    }

    return res;
  }

  Future<ApiResponse> signUp(arg) async {
    ApiResponse res = await api.postAuth(API_SIGN_UP, arg);
    if (res.isOk) {
      // save user token in local
      cfgService.userToken = res.data['token'];
      user.value = User.fromJson(res.data);
    }
    return res;
  }
}
