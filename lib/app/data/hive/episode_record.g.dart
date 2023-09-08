// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeRecordAdapter extends TypeAdapter<EpisodeRecord> {
  @override
  final int typeId = 2;

  @override
  EpisodeRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EpisodeRecord(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      (fields[3] as Map).cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, EpisodeRecord obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.episodeId)
      ..writeByte(1)
      ..write(obj.episodeTitle)
      ..writeByte(2)
      ..write(obj.mediaSrc)
      ..writeByte(3)
      ..write(obj.subtitles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
