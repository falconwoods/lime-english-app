import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/widgets/app_video_player/app_video_player_controller.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends GetView<AppVideoPlayerController> {
  final VideoPlayerController playerCtl;
  final ValueChanged<Duration>? onUpdate;

  const AppVideoPlayer(this.playerCtl, this.onUpdate, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppVideoPlayerController(playerCtl, onUpdate));

    return AspectRatio(
      aspectRatio: playerCtl.value.aspectRatio,
      child: VideoPlayer(playerCtl),
    );
  }
}
