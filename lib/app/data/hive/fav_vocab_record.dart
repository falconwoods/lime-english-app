// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/adapters.dart';
import 'package:lime_english/app/data/hive/example_entity.dart';
import 'package:lime_english/app/data/hive/hive_id.dart';

part 'fav_vocab_record.g.dart';

@HiveType(typeId: 3)
class FavVocabRecord extends HiveObject {
  @HiveField(0)
  String text;

  /// parts of speech collected
  @HiveField(1)
  int types;

  @HiveField(2)
  bool deleted;

  @HiveField(3)
  int updateTimeStamp;

  @HiveField(4)
  Map<int, ExampleEntity> examples;

  FavVocabRecord(
      this.text, this.types, this.deleted, this.updateTimeStamp, this.examples);

  factory FavVocabRecord.empty(String vocab) {
    return FavVocabRecord(vocab, 0, false, 0, {});
  }

  FavVocabRecord addWordType(
      String type, String example, int episodeId, int sequence) {
    types = types = VocabTypes.addWordType(types, type);
    examples[VocabTypes.getIntType(type)] =
        ExampleEntity(example, episodeId, sequence);
    return this;
  }

  FavVocabRecord rmWordType(String type) {
    types = VocabTypes.rmWordType(types, type);
    examples.remove(VocabTypes.getIntType(type));
    return this;
  }

  bool hasWordType(String type) {
    return VocabTypes.hasWordType(types, type);
  }
}

class VocabTypes {
  static const int Noun = 1 << 0; // 00000001
  static const int Verb = 1 << 1; // 00000010
  static const int Adjective = 1 << 2; // 00000100
  static const int Adverb = 1 << 3; // 00001000
  static const int Pronoun = 1 << 4; // 00010000
  static const int Article = 1 << 5; // 00100000
  static const int Numeral = 1 << 6; // 01000000
  static const int Preposition = 1 << 7; // 10000000
  static const int Conjunction = 1 << 8; // 100000000
  static const int Interjection = 1 << 9; // 1000000000
  static const Map<String, int> typeMap = {
    'n.': Noun,
    'v.': Verb,
    'adj.': Adjective,
    'adv.': Adverb,
    'pron.': Pronoun,
    'art.': Article,
    'num.': Numeral,
    'prep.': Preposition,
    'conj.': Conjunction,
    'interj.': Interjection,
  };

  static int getIntType(String type) {
    return typeMap[type] ?? 0;
  }

  static int addWordType(int curTypes, String type) {
    curTypes |= getIntType(type);
    return curTypes;
  }

  static int rmWordType(int curTypes, String type) {
    curTypes &= ~getIntType(type);
    return curTypes;
  }

  static bool hasWordType(int curTypes, String type) {
    return (curTypes & getIntType(type)) != 0;
  }
}
