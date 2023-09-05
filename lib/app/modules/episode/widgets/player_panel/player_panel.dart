import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';
import 'package:lime_english/app/modules/episode/widgets/player_panel/palyer_panel_controller.dart';
import 'package:lime_english/app/widgets/switch_button.dart';
import 'package:lime_english/core/utils/extensions/string_extensions.dart';

class PlayerPanel extends GetView<PlayerPanelController> {
  const PlayerPanel({super.key});

  void onListeningMode() {}

  void onPlayPause() {
    if (controller.ps.isPlaying.value) {
      controller.ps.pause();
    } else {
      controller.ps.play();
    }
  }

  void onPreSentence() {
    controller.ps.preSentence();
  }

  void onNextSentence() {
    controller.ps.nextSentence();
  }

  void onSpeed() {}

  ///extract word, blank and punctuation into an string array from a string

  void onSwitchVideo(int index, dynamic value) {
    ListeningController lc = Get.find<ListeningController>();
    lc.showVideo(value);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(PlayerPanelController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                icon: const Icon(FontAwesomeIcons.earListen),
                iconSize: 20,
                onPressed: onListeningMode),
            SwitchButton(
              values: const [true, false],
              widgets: const [
                Icon(
                  FontAwesomeIcons.eye,
                  size: 20,
                ),
                Icon(
                  FontAwesomeIcons.eyeSlash,
                  size: 20,
                )
              ],
              defaultIndex: 0,
              onSwitch: onSwitchVideo,
            )
          ],
        ),
        Row(
          children: [
            IconButton(
                icon: const Icon(FontAwesomeIcons.backwardStep),
                iconSize: 20,
                onPressed: onPreSentence),
            Obx(
              () => controller.ps.isPlaying.value
                  ? IconButton(
                      icon: const Icon(FontAwesomeIcons.pause),
                      iconSize: 20,
                      onPressed: onPlayPause)
                  : IconButton(
                      icon: const Icon(FontAwesomeIcons.play),
                      iconSize: 20,
                      onPressed: onPlayPause),
            ),
            IconButton(
                icon: const Icon(FontAwesomeIcons.forwardStep),
                iconSize: 20,
                onPressed: onNextSentence),
          ],
        ),
        IconButton(
            icon: const Icon(FontAwesomeIcons.clock),
            iconSize: 20,
            onPressed: onSpeed)
      ],
    );
  }
}