import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/fav_switch.dart';
import 'package:lime_english/app/widgets/vocab_explain/vocab_explain_controller.dart';

class VocabExplain extends GetView<VocabExplainController> {
  final String vocab;
  const VocabExplain(this.vocab, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VocabExplainController(vocab));

    var content = Obx(() {
      var vi = controller.vocabInfo.value;
      var meanings = controller.meanings.value;
      List<Widget> meaningWidgets = [];
      meanings.forEach((key, value) {
        meaningWidgets.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 3, 5, 0),
              child: FavSwitch(false, onChanged: (val) {
                controller.favPartOfSpeech(key);
              }),
            ),
            Expanded(
                child: Text(
              '$key$value',
              // softWrap: true,
              overflow: TextOverflow.ellipsis,
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
