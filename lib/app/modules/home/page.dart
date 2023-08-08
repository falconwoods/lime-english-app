import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/home/controller.dart';
import 'package:lime_english/app/modules/home/widgets/home_nav_bar.dart';

class HomePage extends GetView<HomeController> {
  final List<Widget> _pages = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    FourthPage(),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _pages[controller.selectedIndex.value],
          bottomNavigationBar: HomeNavBar(
            selectedIndex: controller.selectedIndex,
            onItemTap: (index) {
              controller.selectedIndex.value = index;
            },
          ),
        ));
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('First Page'));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Second Page'));
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Third Page'));
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Fourth Page'));
  }
}
