import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/widgets/fav_switch.dart';
import 'package:lime_english/app/widgets/vocab_explain/vocab_explain_controller.dart';

class VocabExplain extends GetView<VocabExplainController> {
  final String vocab;
  final String example;
  final int episodeId;
  final int captionSequence;
  final int nplPosId;

  VocabExplain(this.vocab, this.example, this.nplPosId, this.episodeId,
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
      meanings.forEach((pos, meaning) {
        bool posMatch = controller.ds.matchNPLPos(nplPosId, pos);
        // Get.log('$vocab $vocabPosIndex ${VocabPOS.getPOSId(vt)}');

        meaningWidgets.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 3, 5, 0),
              child: FavSwitch(controller.fvr.value.hasPOS(pos),
                  disabled: false, onChanged: (val) {
                controller.favVocabType(
                    vocab, pos, val, example, episodeId, captionSequence);
              }),
            ),
            Expanded(
                child: Text(
              '$pos.$meaning',
              // softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: posMatch ? Colors.black : Colors.black45,
              ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      vi.word,
                      style:
                          TextStyle(fontSize: 18, color: Colors.blue.shade300),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        vi.pronunciation.isNotEmpty
                            ? '/${vi.pronunciation}/'
                            : '',
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.black38),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(2)),
                  child:
                      Text(controller.ds.getVocabPos(nplPosId)?.desc.tr ?? '',
                          style: const TextStyle(
                              // fontStyle: FontStyle.italic,
                              color: Colors.black26)),
                ),
              ],
            ),
            ...meaningWidgets,
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
