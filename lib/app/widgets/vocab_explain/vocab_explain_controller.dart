import 'package:get/get.dart';
import 'package:lime_english/app/data/hive/fav_vocab_record.dart';
import 'package:lime_english/app/data/sqlite/dic_word.dart';
import 'package:lime_english/app/services/db_service.dart';
import 'package:lime_english/app/services/dic_service.dart';
import 'package:lime_english/app/services/pronounce_service.dart';
import 'package:lime_english/core/utils/extensions/string_extensions.dart';

class VocabExplainController extends GetxController {
  late final DicService dic;
  late final DBService db;
  final String vocab;
  final String sentence;
  late final Rx<DicWord> vocabInfo;
  late final Rx<Map<String, String>> meanings = Rx<Map<String, String>>({});
  late final PronounceService pronService;
  late final FavVocabRecord fvr;

  void favVocabType(String type, bool fav) {
    Get.log('$vocab $type');

    FavVocabRecord fv = db.getFavVocab(vocab);
    if (fav) {
      fv.addWordType(type, sentence);
    } else {
      fv.rmWordType(type);
    }

    db.saveFavVocab(fv);
  }

  VocabExplainController(this.vocab, this.sentence) {
    vocabInfo = Rx<DicWord>(DicWord.empty(vocab));
  }

  @override
  void onInit() async {
    super.onInit();
    dic = Get.find<DicService>();
    db = Get.find<DBService>();
    pronService = Get.find<PronounceService>();

    vocabInfo.value = await dic.findVocab(vocab);
    meanings.value = vocabInfo.value.meaning.splitMeaning();
    fvr = db.getFavVocab(vocab);

    pronounceWord(vocab);
  }

  Future<void> pronounceWord(String vocab) async {
    pronService.pronounce(vocab);
  }
}
