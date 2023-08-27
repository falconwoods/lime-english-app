import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/widgets/app_video_player/app_video_player_arg.dart';
import 'package:lime_english/app/widgets/app_video_player/app_video_player_controller.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends GetView<AppVideoPlayerController> {
  final AppVideoPlayerArg arg;
  const AppVideoPlayer(this.arg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppVideoPlayerController(arg));

    return Obx(() {
      return AspectRatio(
        aspectRatio: controller.aspectRatio.value,
        child: VideoPlayer(controller.videoCtl),
      );
    });
  }
}
