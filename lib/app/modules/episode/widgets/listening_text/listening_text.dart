import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/listening_text_block.dart';

class ListeningText extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  late final List<ListeningTextBlock> blocks = [];

  ListeningText({Key? key}) : super(key: key) {
    ListeningController lc = Get.find<ListeningController>();

    for (var i = 0; i < lc.primaryCap.length; i++) {
      GlobalKey k = GlobalKey();
      blocks.add(ListeningTextBlock(i + 1, lc.primaryCap.getLine(i + 1).text,
          lc.secondaryCap.getLine(i + 1).text, lc.capOption, lc.curSubSequence,
          key: k));
    }

    ever(lc.curSubSequence, (sequence) {
      Get.log('subIndex Updated: $sequence');
      GlobalKey key = blocks[sequence - 1].key as GlobalKey;
      _scrollController.position.ensureVisible(
          key.currentContext!.findRenderObject()!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      controller: _scrollController,
      children: blocks,
    ));
  }
}
