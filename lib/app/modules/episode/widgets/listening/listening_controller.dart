import 'dart:io';

import 'package:get/get.dart';
import 'package:lime_english/app/data/enum/subtitle_option.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_arg.dart';
import 'package:lime_english/app/services/file_service.dart';
import 'package:lime_english/app/services/player/Subtitle.dart';
import 'package:video_player/video_player.dart';

class ListeningController extends GetxController {
  late final ListeningArg arg;
  late final Future<void> initFuture;
  final isDownloading = false.obs;
  final mediaPath = ''.obs;
  final Rx<SubtitleOption> subtitleOption = SubtitleOption.all.obs;
  final Rx<int> curSubtitleIndex = 0.obs;
  // final Rx<Map<String, Subtitle>> _subtitles = Rx<Map<String, Subtitle>>({});
  late final Subtitle primarySubtitle;
  late final Subtitle secondarySubtitle;
  late final SubRipCaptionFile ps;

  ListeningController(this.arg);

  @override
  void onInit() {
    super.onInit();
    initFuture = _init();
  }

  Future<void> _init() async {
    // download video and subtitles
    FileService fs = Get.find<FileService>();
    mediaPath.value = await fs.download(arg.episode.mediaSrc);

    // for (var subtitle in arg.episode.subtitles.entries) {
    //   var sp = await fs.download(subtitle.value);
    //   _subtitles.value[subtitle.key] = await Subtitle().loadFromFile(sp);
    // }

    primarySubtitle = await Subtitle()
        .loadFromFile(await fs.download(arg.episode.subtitles['en']!));
    secondarySubtitle = await Subtitle()
        .loadFromFile(await fs.download(arg.episode.subtitles['cn']!));

    var p = await fs.download(arg.episode.subtitles['en']!);
    var f = File(p);
    ps = SubRipCaptionFile(await f.readAsString());
  }
}
