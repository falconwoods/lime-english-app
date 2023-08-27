import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/widgets/app_video_player/app_video_player.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_arg.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/listening_text.dart';
import 'package:lime_english/app/widgets/app_video_player/app_video_player_arg.dart';
import 'package:video_player/video_player.dart';

class Listening extends GetView<ListeningController> {
  final ListeningTextArg arg;
  const Listening(this.arg, {Key? key}) : super(key: key);

  void onVideoUpdate(VideoPlayerValue value) {
    print(value.position);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ListeningController());

    return SingleChildScrollView(
      child: Column(
        children: [
          AppVideoPlayer(AppVideoPlayerArg(
              'assets/video/ted1.mp4', AppVideoSourceType.asset,
              onUpdate: onVideoUpdate)),
          ListeningText(null)
        ],
      ),
    );
  }
}
