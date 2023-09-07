import 'package:hive_flutter/adapters.dart';
import 'package:lime_english/app/data/hive/fav_vocab_record.dart';
import 'package:lime_english/app/data/hive/hive_id.dart';

class FavVocabAdapter extends TypeAdapter<FavVocabRecord> {
  @override
  final typeId = HiveId.FavVocab;

  @override
  FavVocabRecord read(BinaryReader reader) {
    final vocab = reader.readString();
    final pos = reader.readInt32();
    final deleted = reader.readBool();
    final updateTime = reader.readInt();
    return FavVocabRecord(vocab, pos, updateTime, deleted);
  }

  @override
  void write(BinaryWriter writer, FavVocabRecord obj) {
    writer.writeString(obj.text);
    writer.writeInt32(obj.types);
    writer.writeBool(obj.deleted);
    writer.writeInt(obj.updateTimeStamp);
  }
}
