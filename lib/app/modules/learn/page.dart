import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/learn/controller.dart';

class LearnPage extends GetView<LearnController> {
  final _selectedIndex = 0.obs;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  LearnPage({super.key});

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('BottomNavigationBar Sample'),
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex.value),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            currentIndex: _selectedIndex.value,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: _onItemTapped,
          ),
        ));
  }
}
