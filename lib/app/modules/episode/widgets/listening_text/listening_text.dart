import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/listening_text_controller.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/listening_text_block.dart';

class ListeningText extends GetView<ListeningTextController> {
  const ListeningText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ListeningTextController());

    ListeningController lc = Get.find<ListeningController>();

    List<ListeningTextBlock> blocks = [];
    for (var i = 0; i < lc.primarySubtitle.length; i++) {
      blocks.add(ListeningTextBlock(
          i,
          lc.primarySubtitle.getLine(i).text,
          lc.secondarySubtitle.getLine(i).text,
          lc.subtitleOption,
          lc.curSubtitleIndex));
    }
    return Expanded(
        child: SingleChildScrollView(child: Column(children: blocks)));
  }
}
