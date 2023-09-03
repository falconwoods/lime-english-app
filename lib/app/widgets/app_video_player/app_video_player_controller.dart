import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:lime_english/app/widgets/app_video_player/app_video_player_arg.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayerController extends GetxController {
  late VideoPlayerController videoCtl;
  late final Future<void>? initializeVideoPlayerFuture;
  late final AppVideoPlayerArg arg;
  RxDouble aspectRatio = (16.0 / 9).obs;
  Timer? _timer;

  AppVideoPlayerController(this.arg);

  @override
  void onInit() {
    if (arg.src.startsWith('http')) {
      videoCtl = VideoPlayerController.networkUrl(Uri.parse(arg.src));
    } else if (arg.src.startsWith('assets/')) {
      videoCtl = VideoPlayerController.asset(arg.src);
    } else {
      videoCtl = VideoPlayerController.file(File(arg.src));
    }

    if (arg.onUpdate != null) {
      // videoCtl.addListener(() {
      //   arg.onUpdate!(videoCtl.value);
      // });

      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) async {
        if (isClosed == false) {
          Duration? pos = await videoCtl.position;
          pos = pos ?? Duration.zero;
          arg.onUpdate!(pos);
        }
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
    _timer?.cancel();
    super.onClose();
  }
}
