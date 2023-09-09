import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/data/hive/fav_vocab_record.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/fav_switch.dart';
import 'package:lime_english/app/widgets/vocab_explain/vocab_explain_controller.dart';

class VocabExplain extends GetView<VocabExplainController> {
  final String vocab;
  final String example;
  final int episodeId;
  final int captionSequence;

  /// part of speech of the vocab in the sentence
  final int vocabType;

  VocabExplain(this.vocab, this.example, this.vocabType, this.episodeId,
      this.captionSequence,
      {Key? key})
      : super(key: key) {
    Get.put(VocabExplainController(), permanent: false);
    controller.init(vocab);
  }

  @override
  Widget build(BuildContext context) {
    var content = Obx(() {
      var vi = controller.vocabInfo.value;
      var meanings = controller.meanings.value;
      List<Widget> meaningWidgets = [];
      meanings.forEach((wordType, meaning) {
        bool isCurType = VocabTypes.getIntType(wordType) == vocabType;

        meaningWidgets.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 3, 5, 0),
              child: FavSwitch(controller.fvr.value.hasWordType(wordType),
                  disabled: !isCurType, onChanged: (val) {
                if (isCurType) {
                  controller.favVocabType(vocab, wordType, val, example,
                      episodeId, captionSequence);
                }
              }),
            ),
            Expanded(
                child: Text(
              '$wordType$meaning',
              // softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: isCurType ? Colors.black : Colors.grey),
            ))
          ],
        ));
      });

      return GestureDetector(
        onTap: () => controller.pronounceWord(vocab),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  vi.word,
                  style: TextStyle(fontSize: 18, color: Colors.green.shade400),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '/${vi.pronunciation}/',
                    style: const TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.black38),
                  ),
                )
              ],
            ),
            ...meaningWidgets
          ],
        ),
      );
    });

    return Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        width: double.infinity,
        // height: 100,
        decoration: const BoxDecoration(
          color: Colors.white, // Customize the color of the sheet
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20), // Add rounded corners if desired
          ),
        ),
        child: content);
  }
}
