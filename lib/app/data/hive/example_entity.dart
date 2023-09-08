import 'package:hive_flutter/adapters.dart';

part 'example_entity.g.dart';

@HiveType(typeId: 4)
class ExampleEntity extends HiveObject {
  @HiveField(0)
  String example;

  @HiveField(1)
  int episodeId;

  @HiveField(2)
  int sequence;

  ExampleEntity(this.example, this.episodeId, this.sequence);
}
