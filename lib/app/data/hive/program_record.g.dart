// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProgramRecordAdapter extends TypeAdapter<ProgramRecord> {
  @override
  final int typeId = 1;

  @override
  ProgramRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProgramRecord(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      (fields[4] as List).cast<EpisodeRecord>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProgramRecord obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.programId)
      ..writeByte(1)
      ..write(obj.programTitle)
      ..writeByte(2)
      ..write(obj.cover)
      ..writeByte(3)
      ..write(obj.desc)
      ..writeByte(4)
      ..write(obj.episodes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgramRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
