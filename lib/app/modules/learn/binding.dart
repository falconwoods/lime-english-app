import 'package:get/get.dart';
import 'package:lime_english/app/modules/learn/controller.dart';

class LearnBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearnController>(() => LearnController());
  }
}
