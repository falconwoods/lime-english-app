import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/data/hive/episode_record.dart';
import 'package:lime_english/app/modules/episode/episode_controller.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_arg.dart';
import 'package:lime_english/app/modules/episode/widgets/player_panel/player_panel.dart';

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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: false,
              pinned: false,
              // flexibleSpace: const FlexibleSpaceBar(
              //   title: Text('Scrolling App Bar'),
              // ),
              // expandedHeight: 200,
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
                  onTap: onNote,
                  child: const Icon(Icons.event_note_rounded),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: onMore,
                  child: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ];
        },
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabCtrl,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Listening(ListeningArg(
                  programId: 1,
                  episode: EpisodeRecord(
                      1,
                      'Ted',
                      'http://router.gosolo.space:10000/ted2.mp4',
                      {
                        'cn': 'http://router.gosolo.space:10000/ted2-cn.srt',
                        'en': 'http://router.gosolo.space:10000/ted2-en.srt'
                      },
                      'http://router.gosolo.space:10000/ted2.json'))),
            ),
            const Text('reading')
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: PlayerPanel(),
      ),
    );
  }
}
