import 'package:hive/hive.dart';
import 'package:lime_english/app/data/hive/episode_record.dart';
import 'package:lime_english/app/data/hive/hive_id.dart';

class EpisodeAdapter extends TypeAdapter<EpisodeRecord> {
  @override
  final typeId = HiveId.episode;

  @override
  EpisodeRecord read(BinaryReader reader) {
    final episodeId = reader.readInt();
    final episodeTitle = reader.readString();
    final subtitles = Map<String, String>.from(reader.readMap());
    return EpisodeRecord(episodeId, episodeTitle, subtitles);
  }

  @override
  void write(BinaryWriter writer, EpisodeRecord obj) {
    writer.writeInt(obj.episodeId);
    writer.writeString(obj.episodeTitle);
    writer.writeMap(obj.subtitles);
  }
}
