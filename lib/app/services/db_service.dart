import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hive/hive.dart';
import 'package:lime_english/app/data/hive/episode_adapter.dart';
import 'package:lime_english/app/data/hive/episode_record.dart';
import 'package:lime_english/app/data/hive/program_adapter.dart';
import 'package:lime_english/app/data/hive/program_record.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBService extends GetxService {
  final String dicDBPath = 'assets/db/dic.db';
  final String dicTableWords = 'englishwords';
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

  Future<void> copyAssetDatabase(String dbName, String dbPath) async {
    ByteData data = await rootBundle.load(dbName);
    List<int> bytes = data.buffer.asUint8List();
    await File(dbPath).writeAsBytes(bytes, flush: true);
  }

  Future<Database> initSqlite() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'your_database.db');

    // Check if the database exists in the local storage directory
    bool exists = await databaseExists(path);

    if (!exists) {
      // If the database does not exist, copy it from the assets
      try {
        await copyAssetDatabase(dicDBPath, path);
      } catch (e) {
        // Handle the error, e.g., database file not found in assets
        Get.log('Error copying database: $e', isError: true);
      }
    }

    // Open the database
    return await openDatabase(path);
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
