import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/my/controller.dart';
import 'package:lime_english/routes/app_pages.dart';

class MyPage extends GetView<MyController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyController());

    return Scaffold(
        body: SafeArea(
            child: Row(
      children: [
        FilledButton(
            onPressed: () => Get.toNamed(Routes.LOGIN), child: Text('Login')),
      ],
    )));
  }
}
