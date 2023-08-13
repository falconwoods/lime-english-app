import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/learn/controller.dart';
import 'package:lime_english/app/widgets/card_slider.dart';
import 'package:lime_english/app/modules/learn/widgets/recent_update_item.dart';

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
              'Recent Update',
              controller.recentUpdates.value,
              3,
              60.0,
              (context, data) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: RecentlyUpdatedItem(data),
                  ),
              (itemData) => print(itemData),
              () => {}))
        ],
      ),
    )));
  }
}
