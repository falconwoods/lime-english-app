import 'package:hive_flutter/adapters.dart';
import 'package:lime_english/app/data/hive/episode_record.dart';
import 'package:lime_english/app/data/hive/hive_id.dart';
import 'package:lime_english/app/data/hive/program_record.dart';

class ProgramAdapter extends TypeAdapter<ProgramRecord> {
  @override
  final typeId = HiveId.program;

  @override
  ProgramRecord read(BinaryReader reader) {
    final programId = reader.readInt();
    final programTitle = reader.readString();
    final desc = reader.readString();
    final cover = reader.readString();
    final subtitles = List<EpisodeRecord>.from(reader.readList());
    return ProgramRecord(programId, programTitle, desc, cover, subtitles);
  }

  @override
  void write(BinaryWriter writer, ProgramRecord obj) {
    writer.writeInt(obj.programId);
    writer.writeString(obj.programTitle);
    writer.writeString(obj.desc);
    writer.writeString(obj.cover);
    writer.writeList(obj.episodes);
  }
}
