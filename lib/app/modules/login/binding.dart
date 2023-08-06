import 'package:lime_english/app/data/provider/api.dart';
import 'package:lime_english/app/modules/login/controller.dart';
import 'package:lime_english/app/modules/login/repository.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(LoginRepository(LimeApi())));
  }
}
