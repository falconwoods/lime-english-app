import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/data/sqlite/dic_word.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DicService extends GetxService {
  final String dicDBPath = 'assets/db/dic.db';
  final String dicTableWords = 'englishwords';
  late final Database _liteDB;

  Future<DicService> init() async {
    // init sqlite
    _liteDB = await initSqlite();

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

    bool exists = await databaseExists(path);

    if (!exists) {
      try {
        await copyAssetDatabase(dicDBPath, path);
      } catch (e) {
        Get.log('Error copying database: $e', isError: true);
      }
    }

    return await openDatabase(path);
  }

  @override
  void onClose() {
    _liteDB.close();
  }

  Future<DicWord> findVocab(String vocab) async {
    final List<Map<String, dynamic>> rows = await _liteDB.query(dicTableWords,
        where: 'word = ?', whereArgs: [vocab.toLowerCase()]);

    for (final row in rows) {
      Get.log(
          'Word: ${row['word']}, pronunciation: ${row['pronunciation']},meaning: ${row['meaning']}');
    }

    return rows.isNotEmpty ? DicWord.fromMap(rows[0]) : DicWord.empty(vocab);
  }
}
