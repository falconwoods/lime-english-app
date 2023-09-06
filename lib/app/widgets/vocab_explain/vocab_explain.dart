import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        meaningWidgets.add(Text('$key$value'));
      });
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vi.word,
            style: TextStyle(fontSize: 18, color: Colors.green.shade400),
          ),
          Text(
            '/${vi.pronunciation}/',
            style: const TextStyle(
                fontStyle: FontStyle.italic, color: Colors.black38),
          ),
          ...meaningWidgets
        ],
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
