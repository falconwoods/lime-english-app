import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/home/learn/controller.dart';
import 'package:lime_english/app/modules/home/learn/widgets/hot_program.dart';
import 'package:lime_english/app/widgets/card_slider.dart';
import 'package:lime_english/app/modules/home/learn/widgets/recently_updated_episode.dart';
import 'package:lime_english/routes/app_pages.dart';

class LearnPage extends GetView<LearnController> {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LearnController());

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Obx(() => CardSlider(
              'Hot Program'.tr,
              controller.hotPrograms.value,
              2,
              130,
              0.35,
              (context, data) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: HotProgram(data),
                  ),
              (itemData) => print(itemData),
              () => {})),
          SizedBox(
            height: 15,
          ),
          Obx(() => CardSlider(
              'Recent Update'.tr,
              controller.recentUpdates.value,
              3,
              60.0,
              0.8,
              (context, data) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: RecentlyUpdatedEpisode(data),
                  ),
              (itemData) =>
                  Get.toNamed(Routes.EPISODE, arguments: itemData['episodeId']),
              () => {})),
          SizedBox(
            height: 15,
          ),
          Obx(() => CardSlider(
              'Subscription Update'.tr,
              controller.recentUpdates.value,
              3,
              60.0,
              0.8,
              (context, data) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: RecentlyUpdatedEpisode(data),
                  ),
              (itemData) {},
              () => {})),
        ],
      ),
    )));
  }
}
