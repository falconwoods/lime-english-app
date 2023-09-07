import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/data/sqlite/dic_word.dart';
import 'package:lime_english/app/services/dic_service.dart';
import 'package:lime_english/core/utils/extensions/string_extensions.dart';

class VocabExplainController extends GetxController {
  late final DicService dic;
  final String vocab;
  late final Rx<DicWord> vocabInfo;
  late final Rx<Map<String, String>> meanings = Rx<Map<String, String>>({});
  final FlutterTts flutterTts = FlutterTts();

  void favPartOfSpeech(String partOfSpeech) {
    // TODO: collect part of speech of a vocab
    Get.log('$vocab $partOfSpeech');
  }

  VocabExplainController(this.vocab) {
    vocabInfo = Rx<DicWord>(DicWord.empty(vocab));
  }

  @override
  void onInit() async {
    super.onInit();
    dic = Get.find<DicService>();
    vocabInfo.value = await dic.findVocab(vocab);
    meanings.value = vocabInfo.value.meaning.splitMeaning();
    pronounceWord(vocab);
  }

  Future<void> pronounceWord(String word) async {
    await flutterTts.setLanguage('en-US');
    // await flutterTts.setLanguage('en-GB');
    await flutterTts.speak(word);
  }
}
