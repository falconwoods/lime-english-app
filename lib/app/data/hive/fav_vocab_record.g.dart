// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_vocab_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavVocabRecordAdapter extends TypeAdapter<FavVocabRecord> {
  @override
  final int typeId = 3;

  @override
  FavVocabRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavVocabRecord(
      fields[0] as String,
      fields[1] as int,
      fields[2] as bool,
      fields[3] as int,
      (fields[4] as Map).cast<int, ExampleEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, FavVocabRecord obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.types)
      ..writeByte(2)
      ..write(obj.deleted)
      ..writeByte(3)
      ..write(obj.updateTimeStamp)
      ..writeByte(4)
      ..write(obj.examples);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavVocabRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
