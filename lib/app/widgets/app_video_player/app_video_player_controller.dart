import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayerController extends GetxController {
  final VideoPlayerController playerCtl;
  final ValueChanged<Duration>? onUpdate;

  // RxDouble aspectRatio = (16.0 / 9).obs;
  Timer? _timer;

  AppVideoPlayerController(this.playerCtl, this.onUpdate);

  @override
  void onInit() {
    if (onUpdate != null) {
      // videoCtl.addListener(() {
      //   arg.onUpdate!(videoCtl.value);
      // });

      _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) async {
        if (isClosed == false) {
          Duration? pos = await playerCtl.position;
          pos = pos ?? Duration.zero;
          onUpdate!(pos);
        }
      });
    }

    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
