import 'package:get/get.dart';
import 'package:lime_english/app/services/player/player_service.dart';

class PlayerPanelController extends GetxController {
  late final PlayerService ps;

  PlayerPanelController();

  @override
  void onInit() {
    super.onInit();
    ps = Get.find<PlayerService>();
  }

  void play(bool val) {
    if (val) {
      ps.play();
    } else {
      ps.pause();
    }
  }
}
