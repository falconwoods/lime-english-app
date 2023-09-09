import 'package:get/get.dart';
import 'package:lime_english/app/data/hive/fav_vocab_record.dart';
import 'package:lime_english/app/data/sqlite/dic_word.dart';
import 'package:lime_english/app/services/db_service.dart';
import 'package:lime_english/app/services/dic_service.dart';
import 'package:lime_english/app/services/pronounce_service.dart';
import 'package:lime_english/core/utils/app_util.dart';
import 'package:lime_english/core/utils/extensions/string_extensions.dart';

class VocabExplainController extends GetxController {
  late final DicService dic;
  late final DBService db;
  late final Rx<DicWord> vocabInfo = Rx<DicWord>(DicWord.empty(''));
  late final Rx<Map<String, String>> meanings = Rx<Map<String, String>>({});
  late final PronounceService pronService;
  late final Rx<FavVocabRecord> fvr =
      Rx<FavVocabRecord>(FavVocabRecord.empty(""));

  VocabExplainController();

  @override
  void onInit() async {
    super.onInit();
    dic = Get.find<DicService>();
    db = Get.find<DBService>();
    pronService = Get.find<PronounceService>();

    Get.log('VocabExplainController onInit');
  }

  @override
  void onClose() {
    super.onClose();
    Get.log('VocabExplainController onClose');
  }

  void init(String vocab) async {
    // fav the original vocab instead of singular form
    fvr.value = db.getFavVocab(vocab);

    var ret = await dic.findVocab(vocab);
    if (ret.meaning.isEmpty) {
      vocab = AppUtil.tryGetSingular(vocab);
      ret = await dic.findVocab(vocab);
    }
    vocabInfo.value = ret;
    meanings.value = ret.meaning.splitMeaning();

    pronounceWord(vocab);
  }

  Future<void> pronounceWord(String vocab) async {
    pronService.pronounce(vocab);
  }

  void favVocabType(String vocab, String type, bool fav, String sentence,
      int episodeId, int captionSequence) {
    FavVocabRecord fv = db.getFavVocab(vocab);
    if (fav) {
      fv.addWordType(type, sentence, episodeId, captionSequence);
    } else {
      fv.rmWordType(type);
    }

    db.saveFavVocab(fv);
  }
}
