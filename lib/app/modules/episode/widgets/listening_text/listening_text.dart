import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/data/enum/subtitle_option.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/listening_text_controller.dart';

class ListeningText extends GetView<ListeningTextController> {
  const ListeningText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ListeningTextController());

    ListeningController lc = Get.find<ListeningController>();

    List<TextBlock> blocks = [];
    for (var i = 0; i < lc.primarySubtitle.length; i++) {
      blocks.add(TextBlock(i, lc.primarySubtitle.getLine(i).text,
          lc.secondarySubtitle.getLine(i).text, lc.subtitleOption));
    }
    return Column(children: blocks);
  }
}

class TextBlock extends StatelessWidget {
  final int index;
  final String primaryText;
  final String secondaryText;
  final Rx<SubtitleOption> subtitleOption;

  const TextBlock(
      this.index, this.primaryText, this.secondaryText, this.subtitleOption,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      verticalDirection: VerticalDirection.up,
      children: [
        InkWell(onTap: () => {}, child: Icon(Icons.favorite)),
        Column(
          children: [Text(primaryText), Text(secondaryText)],
        )
      ],
    );
  }
}
