// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExampleEntityAdapter extends TypeAdapter<ExampleEntity> {
  @override
  final int typeId = 4;

  @override
  ExampleEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExampleEntity(
      fields[0] as String,
      fields[1] as int,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExampleEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.example)
      ..writeByte(1)
      ..write(obj.episodeId)
      ..writeByte(2)
      ..write(obj.sequence);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExampleEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
