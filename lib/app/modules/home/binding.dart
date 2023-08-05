import 'package:lime_english/app/data/provider/api.dart';
import 'package:lime_english/app/modules/home/controller.dart';
import 'package:lime_english/app/modules/home/repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(HomeRepository(MyApi())));
  }
}
