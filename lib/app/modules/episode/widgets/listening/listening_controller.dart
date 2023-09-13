import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:lime_english/app/data/enum/subtitle_option.dart';
import 'package:lime_english/app/data/episode_meta.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_arg.dart';
import 'package:lime_english/app/services/player/app_caption.dart';
import 'package:lime_english/app/services/player/player_service.dart';
import 'package:video_player/video_player.dart';

class ListeningController extends GetxController {
  late ListeningArg arg;
  // late final Future<void> initFuture;
  final Rx<bool> showVideo = true.obs;
  final isDownloading = false.obs;
  final Rx<CaptionOption> capOption = CaptionOption.all.obs;
  final Rx<int> curSubSequence = 1.obs;
  late AppCaption primaryCap;
  late AppCaption secondaryCap;
  late EpisodeMeta episodeMeta;
  late VideoPlayerController playerCtl;

  late Timer? _timer;

  ListeningController();

  @override
  void onInit() {
    super.onInit();
    // initFuture = _init();
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
    // playerCtl.removeListener(onPlayerUpdate);
  }

  Future<void> init(ListeningArg arg) async {
    this.arg = arg;
    PlayerService ps = Get.find<PlayerService>();
    LoadResult ret = await ps.loadEpisode(arg.episode);
    primaryCap = ret.primarySub;
    secondaryCap = ret.secondarySub;
    episodeMeta = ret.episodeMeta;
    playerCtl = ps.videoCtl!;
    // playerCtl.addListener(onPlayerUpdate);
    // playerCtl.play();

    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) async {
      if (isClosed == false) {
        Duration? pos = await playerCtl.position;
        pos = pos ?? Duration.zero;
        onPlayerUpdate(pos);
      }
    });
  }

  void onPlayerUpdate(Duration position) {
    // Duration position = playCtl.value.position;
    var se = primaryCap.getSubtitle(position);
    curSubSequence.value = se.sequence;
    // Get.log('onPlayerUpdate $position ${controller.curSubtitleIndex} ${se.text}');
  }

  void onShowVideo(bool val) {
    showVideo.value = val;
  }
}
