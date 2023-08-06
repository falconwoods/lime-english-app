import 'package:get/get.dart';

import '../../data/provider/base_api.dart';
import 'controller.dart';
import 'repository.dart';

class LearnBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearnController>(() => LearnController(LearnRepository(BaseAPI())));
  }
}
