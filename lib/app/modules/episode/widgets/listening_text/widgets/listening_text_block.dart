import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/data/enum/subtitle_option.dart';
import 'package:lime_english/app/data/hive/fav_vocab_record.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/fav_switch.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/listening_text_block_controller.dart';
import 'package:lime_english/app/services/player/player_service.dart';
import 'package:lime_english/app/widgets/vocab_explain/vocab_explain.dart';
import 'package:lime_english/core/utils/app_util.dart';
import 'package:lime_english/core/utils/extensions/string_extensions.dart';

class ListeningTextBlock extends GetView<ListeningTextBlockController> {
  /// starts from 1
  final int sequence;
  final String primaryText;
  final String secondaryText;
  final Rx<CaptionOption> subtitleOption;
  final Rx<int> playingSequence;
  final Rx<int> selectedWordIndex = (-1).obs;
  late final List<String> words;

  ListeningTextBlock(this.sequence, this.primaryText, this.secondaryText,
      this.subtitleOption, this.playingSequence,
      {Key? key})
      : super(key: key) {
    words = primaryText.splitWords();
    Get.log(words.toString());
  }

  void onTapWord(int index) async {
    selectedWordIndex.value = index;
    PlayerService ps = controller.ps;
    bool isPlaying = ps.isPlaying.value;
    if (isPlaying) {
      ps.pause();
    }

    Get.bottomSheet(
      VocabExplain(words[index], primaryText, 1,
          controller.listenCtrl.arg.episode.episodeId, sequence),
      isScrollControlled: true,
      barrierColor: Colors.transparent, // Set background color to transparent
    ).whenComplete(() {
      selectedWordIndex.value = -1;
      if (isPlaying) {
        ps.play();
      }
    });
  }

  getPrimaryText() {
    return Obx(() {
      List<TextSpan> arr = [];
      for (int i = 0; i < words.length; i++) {
        LongPressGestureRecognizer? tapGes;

        String text = words[i];

        if (text.isWord()) {
          tapGes = LongPressGestureRecognizer()
            ..onLongPress = () {
              onTapWord(i);
            };
        }

        Color bgColor = Colors.transparent;

        FavVocabRecord fbr = controller.db.getFavVocab(text);
        if (fbr.updateTimeStamp != 0) {
          bgColor = Colors.blue.shade100;
        }

        if (selectedWordIndex.value == i) {
          bgColor = const Color.fromARGB(255, 143, 214, 180);
        }

        arr.add(TextSpan(
            text: text,
            style: TextStyle(
                fontSize: 16,
                backgroundColor: bgColor,
                color: playingSequence.value == sequence
                    ? Colors.green.shade400
                    : Colors.black,
                fontWeight: FontWeight.w400),
            recognizer: tapGes));
      }

      return RichText(
        text: TextSpan(children: arr),
      );
    });
  }

  getSecondaryText() {
    return Text(secondaryText,
        style: const TextStyle(fontSize: 14, color: Colors.black54));
  }

  void onTapBlock() {
    PlayerService ps = controller.ps;
    ps.jumpToSentence(sequence);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ListeningTextBlockController());

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
                child: GestureDetector(
              onTap: onTapBlock,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [getPrimaryText(), getSecondaryText()],
              ),
            ))
          ],
        ));
  }
}
