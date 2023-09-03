import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/listening_text_block.dart';

class ListeningTextController extends GetxController {
  late final ScrollController scrollCtl;
  late final List<ListeningTextBlock> blocks = [];

  ListeningTextController(this.scrollCtl);

  @override
  void onInit() {
    super.onInit();

    ListeningController lc = Get.find<ListeningController>();

    for (var i = 0; i < lc.primarySubtitle.length; i++) {
      GlobalKey k = GlobalKey();
      blocks.add(ListeningTextBlock(
          i,
          lc.primarySubtitle.getLine(i).text,
          lc.secondarySubtitle.getLine(i).text,
          lc.subtitleOption,
          lc.curSubtitleIndex,
          key: k));
    }

    ever(lc.curSubtitleIndex, (index) {
      GlobalKey key = blocks[index].key as GlobalKey;
      scrollCtl.position.ensureVisible(key.currentContext!.findRenderObject()!,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
      Get.log('subIndex Updated: $index');
    });
  }
}
