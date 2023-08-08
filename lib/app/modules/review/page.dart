import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/my/controller.dart';
import 'package:lime_english/app/modules/review/controller.dart';

class ReviewPage extends GetView<ReviewController> {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReviewController());

    return Obx(() => Scaffold(
            body: SafeArea(
                child: Row(
          children: [
            FilledButton(
                onPressed: () => controller.count.value++,
                child: Text('review')),
            Text('${controller.count.value}')
          ],
        ))));
  }
}
