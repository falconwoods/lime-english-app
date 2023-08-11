import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/learn/controller.dart';

class LearnPage extends GetView<LearnController> {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LearnController());

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Column(
        children: [],
      ),
    )));
  }
}
