import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';
import 'package:lime_english/app/services/db_service.dart';
import 'package:lime_english/app/services/dic_service.dart';
import 'package:lime_english/app/services/player/player_service.dart';

class ListeningTextBlockController extends GetxController {
  late final PlayerService ps;
  late final DBService db;
  late final DicService dic;
  late final ListeningController listenCtrl;

  @override
  void onInit() {
    super.onInit();
    ps = Get.find<PlayerService>();
    db = Get.find<DBService>();
    dic = Get.find<DicService>();
    listenCtrl = Get.find<ListeningController>();
  }
}
