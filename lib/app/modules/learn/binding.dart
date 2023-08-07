import 'package:get/get.dart';
import 'controller.dart';

class LearnBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearnController>(() => LearnController());
  }
}
