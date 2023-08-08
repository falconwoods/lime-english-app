import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/learn/controller.dart';

class LearnPage extends GetView<LearnController> {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LearnController());

    return Obx(() => Scaffold(
            body: SafeArea(
                child: Row(
          children: [
            FilledButton(
                onPressed: () => controller.count.value++, child: Text('ok')),
            Text('${controller.count.value}')
          ],
        ))));
  }
}
