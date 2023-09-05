import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/data/enum/subtitle_option.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/fav_switch.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/listening_text_block_controller.dart';
import 'package:lime_english/app/services/player/player_service.dart';
import 'package:lime_english/core/utils/extensions/string_extensions.dart';

class ListeningTextBlock extends GetView<ListeningTextBlockController> {
  /// starts from 1
  final int sequence;
  final String primaryText;
  final String secondaryText;
  final Rx<SubtitleOption> subtitleOption;
  final Rx<int> playingSequence;
  final Rx<int> selectedWordIndex = (-1).obs;

  ListeningTextBlock(this.sequence, this.primaryText, this.secondaryText,
      this.subtitleOption, this.playingSequence,
      {Key? key})
      : super(key: key);

  void onTapWord(int index) {
    selectedWordIndex.value = index;
    PlayerService ps = controller.ps;
    bool isPlaying = ps.isPlaying.value;
    if (isPlaying) {
      ps.pause();
    }

    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Customize the color of the sheet
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20), // Add rounded corners if desired
          ),
        ),
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Gallery'),
              onTap: () {
                // Handle gallery option
                Get.back(); // Close the bottom sheet
              },
            ),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              onTap: () {
                // Handle camera option
                Get.back(); // Close the bottom sheet
              },
            ),
            // Add more options as needed
          ],
        ),
      ),
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
      final words = primaryText.splitWords();

      List<TextSpan> arr = [];
      for (int i = 0; i < words.length; i++) {
        LongPressGestureRecognizer? tapGes;
        if (words[i].isWord()) {
          tapGes = LongPressGestureRecognizer()
            ..onLongPress = () {
              onTapWord(i);
            };
        }

        Color bgColor = Colors.transparent;
        if (selectedWordIndex.value == i) {
          bgColor = const Color.fromARGB(255, 143, 214, 180);
        }

        arr.add(TextSpan(
            text: words[i],
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
