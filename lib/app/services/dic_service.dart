import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/data/sqlite/dic_word.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DicService extends GetxService {
  // dic db
  final String dicDBPath = 'assets/db/dic.db';
  final String dicTableWords = 'english';
  late final Database _liteDB;

  // npl pos
  final vocabPosPath = 'assets/config/vocab_pos.json';
  late final Map<int, NPLPos> nplAllPos;
  late final Map<String, DicPos> _dicPos;

  Future<DicService> init() async {
    // init sqlite
    _liteDB = await initSqlite();

    // ini nplAllPOS
    final jsonStr = await rootBundle.loadString(vocabPosPath);
    final json = jsonDecode(jsonStr);
    nplAllPos = Map<int, NPLPos>.from(json['npl_pos'].map((key, value) {
      return MapEntry(int.parse(key), NPLPos.fromMap(int.parse(key), value));
    }));

    _dicPos = Map<String, DicPos>.from(json['dic_pos'].map((key, value) {
      return MapEntry(key, DicPos(value));
    }));

    return this;
  }

  Future<Database> initSqlite() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'dic.db');

    bool exists = await databaseExists(path);

    if (!exists) {
      try {
        await _copyAssetDatabase(dicDBPath, path);
      } catch (e) {
        Get.log('Error copying database: $e', isError: true);
      }
    }

    return await openDatabase(path);
  }

  Future<void> _copyAssetDatabase(String dbName, String dbPath) async {
    ByteData data = await rootBundle.load(dbName);
    List<int> bytes = data.buffer.asUint8List();
    await File(dbPath).writeAsBytes(bytes, flush: true);
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

  NPLPos? getVocabPos(int id) {
    return nplAllPos[id];
  }

  /// if dic pos match vocab current pos
  bool matchNPLPos(int curNPLPosId, String dicPos) {
    NPLPos? vp = getVocabPos(curNPLPosId);
    if (vp == null) return false;
    return vp.alias.contains(dicPos);
  }

  int getPosId(String dicPos) {
    return _dicPos[dicPos]?.id ?? 0;
  }

  int getPosValue(String dicPos) {
    return _dicPos[dicPos]?.value ?? 0;
  }

  int addWordPOS(int curTypes, String type) {
    curTypes |= getPosValue(type);
    return curTypes;
  }

  int rmWordPOS(int curTypes, String type) {
    curTypes &= ~getPosValue(type);
    return curTypes;
  }

  bool hasWordPOS(int curTypes, String type) {
    return (curTypes & getPosValue(type)) != 0;
  }
}

class DicPos {
  late final int id;
  late final int value;

  DicPos(this.id) {
    value = 1 << id;
  }
}

class NPLPos {
  late final String name;
  late final String category;
  late final List<String> alias;
  late final String desc;

  // extra
  late final int id;
  late final int value;

  NPLPos.fromMap(this.id, Map<String, dynamic> map) {
    name = map['name'];
    category = map['category'];
    alias = map['alias'].cast<String>();
    desc = map['desc'];

    value = 1 << id;
  }
}
