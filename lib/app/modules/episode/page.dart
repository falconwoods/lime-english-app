import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/controller.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_arg.dart';
import 'package:lime_english/app/modules/login/widgets/login_option.dart';
import 'package:lime_english/routes/pages.dart';

class EpisodePage extends GetView<EpisodeController> {
  late final TabController _tabCtrl;

  EpisodePage({super.key}) {
    _tabCtrl = TabController(length: 2, vsync: controller);
  }

  onMore() {}

  onNote() {}

  @override
  Widget build(BuildContext context) {
    final tabs = ['Listening'.tr, 'Reading'.tr];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: TabBar(
          controller: _tabCtrl,
          isScrollable: true,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
        actions: [
          InkWell(
            child: Icon(Icons.event_note_rounded),
            onTap: onNote,
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            child: Icon(Icons.more_vert),
            onTap: onMore,
          ),
        ],
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabCtrl,
        children: [
          for (final tab in tabs)
            Padding(
              padding: EdgeInsets.all(4),
              child: Listening(ListeningTextArg()),
            ),
        ],
      ),
    );
  }
}
