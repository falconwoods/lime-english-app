import 'package:hive_flutter/adapters.dart';
import 'package:lime_english/app/data/hive/hive_id.dart';

part 'episode_record.g.dart';

@HiveType(typeId: 2)
class EpisodeRecord extends HiveObject {
  @HiveField(0)
  int episodeId;

  @HiveField(1)
  String episodeTitle;

  @HiveField(2)
  String mediaSrc;

  @HiveField(3)
  Map<String, String> subtitles;

  EpisodeRecord(
      this.episodeId, this.episodeTitle, this.mediaSrc, this.subtitles);
}
