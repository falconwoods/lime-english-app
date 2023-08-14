import 'package:lime_english/app/modules/episode/controller.dart';
import 'package:get/get.dart';

class EpisodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EpisodeController>(() => EpisodeController());
  }
}
