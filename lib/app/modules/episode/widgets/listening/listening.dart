import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/listening_text_controller.dart';
import 'package:lime_english/app/widgets/app_video_player/app_video_player.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_arg.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/listening_text.dart';
import 'package:lime_english/app/widgets/app_video_player/app_video_player_arg.dart';
import 'package:video_player/video_player.dart';

class Listening extends GetView<ListeningController> {
  final ListeningArg arg;
  Listening(this.arg, {Key? key}) : super(key: key);
  var cnt = 500.0.obs;

  void onVideoUpdate(Duration position) {
    var se = controller.primarySubtitle.getSubtitle(position);
    controller.curSubtitleIndex.value = se.index - 1;
    // Get.log('videoUpdate $position ${controller.curSubtitleIndex} ${se.text}');

    for (final Caption caption in controller.ps.captions) {
      if (caption.start <= position && caption.end >= position) {
        controller.curSubtitleIndex.value = caption.number - 1;
        // Get.log('videoUpdate $position ${caption.number} ${caption.text}');
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ListeningController(arg));

    return FutureBuilder<void>(
        future: controller.initFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppVideoPlayer(AppVideoPlayerArg(controller.mediaPath.value,
                    onUpdate: onVideoUpdate)),
                ListeningText()
              ],
            );
          }
        });
  }
}
