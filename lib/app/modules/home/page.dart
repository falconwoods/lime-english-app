import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/home/controller.dart';
import 'package:lime_english/app/modules/home/widgets/home_nav_bar.dart';
import 'package:lime_english/app/modules/home/learn/page.dart';
import 'package:lime_english/app/modules/home/my/page.dart';
import 'package:lime_english/app/modules/home/quiz/page.dart';
import 'package:lime_english/app/modules/home/review/page.dart';

class HomePage extends GetView<HomeController> {
  final List<Widget> _pages = [
    LearnPage(),
    const ReviewPage(),
    const QuizPage(),
    const MyPage(),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[controller.selectedIndex.value]),
      bottomNavigationBar: HomeNavBar(
        selectedIndex: controller.selectedIndex,
        onItemTap: (index) {
          controller.selectedIndex.value = index;
        },
      ),
    );
  }
}
