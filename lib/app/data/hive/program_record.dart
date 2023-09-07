import 'package:hive_flutter/adapters.dart';
import 'package:lime_english/app/data/hive/episode_record.dart';
import 'package:lime_english/app/data/hive/hive_id.dart';

@HiveType(typeId: HiveId.program)
class ProgramRecord extends HiveObject {
  @HiveField(0)
  int programId;

  @HiveField(1)
  String programTitle;

  @HiveField(2)
  String cover;

  @HiveField(3)
  String desc;

  @HiveField(4)
  List<EpisodeRecord> episodes;

  ProgramRecord(
      this.programId, this.programTitle, this.cover, this.desc, this.episodes);
}
