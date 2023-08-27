import 'dart:io';

import 'package:get/get.dart';
import 'package:lime_english/app/widgets/app_video_player/app_video_player_arg.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayerController extends GetxController {
  Rx<VideoPlayerController?> videoCtl = Rx<VideoPlayerController?>(null);
  Future<void>? initializeVideoPlayerFuture;

  void setArg(AppVideoPlayerArg arg) {
    if (videoCtl.value != null) return;

    if (arg.srcType == AppVideoSourceType.url) {
      videoCtl.value = VideoPlayerController.networkUrl(Uri.parse(arg.src));
    } else if (arg.srcType == AppVideoSourceType.asset) {
      videoCtl.value = VideoPlayerController.asset(arg.src);
    } else {
      videoCtl.value = VideoPlayerController.file(File(arg.src));
    }

    if (arg.onUpdate != null) {
      videoCtl.value!.addListener(() {
        arg.onUpdate!(videoCtl.value!.value);
      });
    }

    initializeVideoPlayerFuture = videoCtl.value!.initialize().then((_) {
      videoCtl.value!.play();
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    videoCtl.value?.dispose();
    super.onClose();
  }
}
