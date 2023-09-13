// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/adapters.dart';
import 'package:lime_english/app/data/hive/example_entity.dart';
import 'package:lime_english/app/data/hive/hive_id.dart';
import 'package:lime_english/core/utils/vocab_pos.dart';

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

  FavVocabRecord addWordPOS(
      String type, String example, int episodeId, int sequence) {
    types = VocabPOS.addWordPOS(types, type);
    examples[VocabPOS.getPOSValue(type)] =
        ExampleEntity(example, episodeId, sequence);
    return this;
  }

  FavVocabRecord rmWordPOS(String type) {
    types = VocabPOS.rmWordPOS(types, type);
    examples.remove(VocabPOS.getPOSValue(type));
    return this;
  }

  bool hasPOS(String type) {
    return VocabPOS.hasWordPOS(types, type);
  }
}
