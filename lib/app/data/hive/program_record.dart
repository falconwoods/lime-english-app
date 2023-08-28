import 'package:hive/hive.dart';
import 'package:lime_english/app/data/hive/episode_record.dart';

@HiveType(typeId: 0)
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
