import 'package:get/get.dart';

import '../../data/provider/api.dart';
import 'controller.dart';
import 'repository.dart';

class LearnBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearnController>(
        () => LearnController(LearnRepository(LimeApi())));
  }
}
