import 'package:hive/hive.dart';
import 'package:lime_english/app/data/hive/hive_id.dart';

@HiveType(typeId: HiveId.episode)
class EpisodeRecord extends HiveObject {
  @HiveField(0)
  int episodeId;

  @HiveField(1)
  String episodeTitle;

  @HiveField(2)
  Map<String, String> subtitles;

  EpisodeRecord(this.episodeId, this.episodeTitle, this.subtitles);
}
