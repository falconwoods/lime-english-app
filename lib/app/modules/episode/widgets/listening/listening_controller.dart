import 'dart:io';

import 'package:get/get.dart';
import 'package:lime_english/app/data/enum/subtitle_option.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_arg.dart';
import 'package:lime_english/app/services/file_service.dart';
import 'package:lime_english/app/services/player/Subtitle.dart';
import 'package:lime_english/app/services/player/player_service.dart';
import 'package:video_player/video_player.dart';

class ListeningController extends GetxController {
  late final ListeningArg arg;
  late final Future<void> initFuture;
  final isDownloading = false.obs;
  final Rx<SubtitleOption> subtitleOption = SubtitleOption.all.obs;
  final Rx<int> curSubSequence = 1.obs;
  // final Rx<Map<String, Subtitle>> _subtitles = Rx<Map<String, Subtitle>>({});
  late final Subtitle primarySubtitle;
  late final Subtitle secondarySubtitle;
  late final VideoPlayerController playCtl;

  ListeningController(this.arg);

  @override
  void onInit() {
    super.onInit();
    initFuture = _init();
  }

  @override
  void onClose() {
    super.onClose();
    playCtl.removeListener(onPlayerUpdate);
  }

  Future<void> _init() async {
    PlayerService ps = Get.find<PlayerService>();
    LoadResult ret = await ps.loadEpisode(arg.episode);
    primarySubtitle = ret.primarySub;
    secondarySubtitle = ret.secondarySub;
    playCtl = ps.videoCtl!;
    playCtl.addListener(onPlayerUpdate);
    playCtl.play();
  }

  void onPlayerUpdate() {
    Duration position = playCtl.value.position;
    var se = primarySubtitle.getSubtitle(position);
    curSubSequence.value = se.sequence;
    // Get.log('onPlayerUpdate $position ${controller.curSubtitleIndex} ${se.text}');
  }
}
