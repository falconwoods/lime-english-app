import 'package:get/get.dart';
import 'package:lime_english/app/services/player/player_service.dart';

class ListeningTextBlockController extends GetxController {
  late final PlayerService ps;

  ListeningTextBlockController();

  @override
  void onInit() {
    super.onInit();
    ps = Get.find<PlayerService>();
  }
}
