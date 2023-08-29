import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayerArg {
  late final String src;
  late final ValueChanged<VideoPlayerValue>? onUpdate;

  AppVideoPlayerArg(this.src, {this.onUpdate});
}

// enum AppVideoSourceType { file, asset, url }
