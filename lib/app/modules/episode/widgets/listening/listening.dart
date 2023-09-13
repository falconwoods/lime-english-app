import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/listening_text.dart';
import 'package:lime_english/app/widgets/app_video_player/app_video_player.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_arg.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';

class Listening extends GetView<ListeningController> {
  final ListeningArg arg;

  Listening(this.arg, {Key? key}) : super(key: key) {
    Get.put(ListeningController(), permanent: false);
  }

  Widget video() {
    try {
      return Obx(
        () {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: controller.showVideo.value
                ? AppVideoPlayer(controller.playerCtl)
                : Container(),
          );
        },
      );
    } catch (e) {
      Get.log(isError: true, 'video ${e.toString()}');
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: controller.init(arg),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.active) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [video(), ListeningText()],
            );
          }
        });
  }
}
