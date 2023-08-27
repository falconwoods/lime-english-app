import 'dart:io';

import 'package:get/get.dart';
import 'package:lime_english/app/widgets/app_video_player/app_video_player_arg.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayerController extends GetxController {
  late VideoPlayerController videoCtl;
  late final Future<void>? initializeVideoPlayerFuture;
  late final AppVideoPlayerArg arg;
  RxDouble aspectRatio = (16.0 / 9).obs;

  AppVideoPlayerController(this.arg);

  @override
  void onInit() {
    if (arg.srcType == AppVideoSourceType.url) {
      videoCtl = VideoPlayerController.networkUrl(Uri.parse(arg.src));
    } else if (arg.srcType == AppVideoSourceType.asset) {
      videoCtl = VideoPlayerController.asset(arg.src);
    } else {
      videoCtl = VideoPlayerController.file(File(arg.src));
    }

    if (arg.onUpdate != null) {
      videoCtl.addListener(() {
        arg.onUpdate!(videoCtl.value);
      });
    }

    initializeVideoPlayerFuture = videoCtl.initialize().then((_) {
      videoCtl.play();
      aspectRatio.value = videoCtl.value.aspectRatio;
    });

    super.onInit();
  }

  @override
  void onClose() {
    videoCtl.dispose();
    super.onClose();
  }
}
