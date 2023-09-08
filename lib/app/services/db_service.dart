import 'package:hive_flutter/hive_flutter.dart';
import 'package:lime_english/app/data/hive/example_entity.dart';
import 'package:lime_english/app/data/hive/fav_vocab_record.dart';
import 'package:lime_english/app/data/hive/episode_record.dart';
import 'package:lime_english/app/data/hive/program_record.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class DBService extends GetxService {
  late final Box<FavVocabRecord> _favVocabBox;
  late final Box<ProgramRecord> _programBox;
  late final Box<EpisodeRecord> _episodeBox;

  Future<DBService> init() async {
    // init hive
    final suppDir = await getApplicationSupportDirectory();
    Hive.init(suppDir.path);
    // await Hive.initFlutter();
    // await Hive.deleteFromDisk();

    Hive.registerAdapter<FavVocabRecord>(FavVocabRecordAdapter());
    Hive.registerAdapter<ExampleEntity>(ExampleEntityAdapter());
    Hive.registerAdapter<ProgramRecord>(ProgramRecordAdapter());
    Hive.registerAdapter<EpisodeRecord>(EpisodeRecordAdapter());

    // open box
    _favVocabBox = await Hive.openBox<FavVocabRecord>('favVocabBox');
    _programBox = await Hive.openBox<ProgramRecord>('programBox');
    _episodeBox = await Hive.openBox<EpisodeRecord>('episodeBox');

    return this;
  }

  @override
  void onClose() async {
    await _favVocabBox.close();
    await _programBox.close();
    await _episodeBox.close();
  }

  // program
  ProgramRecord? getProgram(int programId) {
    return _programBox.get(programId);
  }

  EpisodeRecord? getEpisdode(int programId, int episodeId) {
    ProgramRecord? program = getProgram(programId);
    return program?.episodes
        .firstWhereOrNull((element) => element.episodeId == episodeId);
  }

  void saveProgram(ProgramRecord program) {
    _programBox.put(program.programId, program);
  }

  // fav vocab
  FavVocabRecord getFavVocab(String vocab) {
    FavVocabRecord? ret = _favVocabBox.get(vocab);
    return ret ?? FavVocabRecord.empty(vocab);
  }

  void saveFavVocab(FavVocabRecord vocab) {
    vocab.updateTimeStamp = DateTime.now().millisecondsSinceEpoch;
    _favVocabBox.put(vocab.text, vocab);
  }

  void saveFavVocabs(List<FavVocabRecord> vocabs) {
    for (var vocab in vocabs) {
      saveFavVocab(vocab);
    }
  }

  List<FavVocabRecord> getFavVocabsAfter(int updateTimeStamp) {
    final ret = _favVocabBox.values
        .where((favVocab) => favVocab.updateTimeStamp > updateTimeStamp)
        .toList();
    return ret;
  }
}
