import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/listening_text_block.dart';

class ListeningTextController extends GetxController {
  late final List<ListeningTextBlock> blocks = [];
  late Worker? worker;

  ListeningTextController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    worker?.dispose();
  }

  void init(ScrollController scrollCtl) {
    ListeningController lc = Get.find<ListeningController>();

    for (var i = 0; i < lc.primaryCap.length; i++) {
      GlobalKey k = GlobalKey();
      blocks.add(ListeningTextBlock(i + 1, lc.primaryCap.getLine(i + 1).text,
          lc.secondaryCap.getLine(i + 1).text, lc.capOption, lc.curSubSequence,
          key: k));
    }

    worker = ever(lc.curSubSequence, (sequence) {
      GlobalKey key = blocks[sequence - 1].key as GlobalKey;
      scrollCtl.position.ensureVisible(key.currentContext!.findRenderObject()!,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
      Get.log('subIndex Updated: $sequence');
    });
  }
}
