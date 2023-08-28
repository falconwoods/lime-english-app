import 'package:hive/hive.dart';
import 'package:lime_english/app/data/hive/episode_adapter.dart';
import 'package:lime_english/app/data/hive/episode_record.dart';
import 'package:lime_english/app/data/hive/program_adapter.dart';
import 'package:lime_english/app/data/hive/program_record.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class DBService extends GetxService {
  late final Box<ProgramRecord> _programBox;

  Future<DBService> init() async {
    // init hive
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    // register adapters
    List<TypeAdapter> adapters = [ProgramAdapter(), EpisodeAdapter()];
    adapters.forEach(Hive.registerAdapter);

    // open box
    _programBox = await Hive.openBox<ProgramRecord>('programBox');

    return this;
  }

  @override
  void onClose() {
    _programBox.close();
  }

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
}
