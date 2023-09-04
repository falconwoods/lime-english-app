import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/data/enum/subtitle_option.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/fav_switch.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/listening_text_block_controller.dart';

class ListeningTextBlock extends GetView<ListeningTextBlockController> {
  final int index;
  final String primaryText;
  final String secondaryText;
  final Rx<SubtitleOption> subtitleOption;
  final Rx<int> playingLine;

  const ListeningTextBlock(this.index, this.primaryText, this.secondaryText,
      this.subtitleOption, this.playingLine,
      {Key? key})
      : super(key: key);

  getPrimaryText() {
    return Obx(() {
      // if (playingLine.value == index) Get.log('uiUpdate $index $primaryText');
      return Text(primaryText,
          style: TextStyle(
              fontSize: 16,
              color: playingLine.value == index
                  ? Colors.green.shade400
                  : Colors.black,
              fontWeight: FontWeight.w400));
    });
  }

  getSecondaryText() {
    return Text(secondaryText,
        style: const TextStyle(fontSize: 14, color: Colors.black54));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 10, 0),
              child: FavSwitch(
                false,
                onChanged: (val) {
                  Get.log('collect $val');
                },
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [getPrimaryText(), getSecondaryText()],
            ))
          ],
        ));
  }
}
