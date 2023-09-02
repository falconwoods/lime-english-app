import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/learn/controller.dart';
import 'package:lime_english/app/modules/quiz/controller.dart';

class QuizPage extends GetView<QuizController> {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());

    return Obx(() => Scaffold(
            body: SafeArea(
                child: Row(
          children: [
            FilledButton(
                onPressed: () => controller.count.value++, child: Text('quiz')),
            Text('${controller.count.value}')
          ],
        ))));
  }
}
