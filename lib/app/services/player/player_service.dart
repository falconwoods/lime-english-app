import 'dart:io';

import 'package:lime_english/app/data/hive/episode_record.dart';
import 'package:lime_english/app/services/file_service.dart';
import 'package:lime_english/app/services/player/app_caption.dart';
import 'package:lime_english/core/values/consts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';

class LoadResult {
  late final AppCaption primarySub;
  late final AppCaption secondarySub;

  LoadResult(this.primarySub, this.secondarySub);
}

enum ResourceType { network, asset, file }

class PlayerService extends GetxService {
  late GetStorage box;

  // storage vars
  int _curPlayingProgramId = -1;
  int _curPlayingEpisodeId = -1;

  // subtitle
  AppCaption caption = AppCaption();
  var subtitleText = ''.obs;
  var subtitleIndex = 0.obs;

  // player status
  final Rx<bool> isPlaying = false.obs;

  VideoPlayerController? videoCtl;

  Future<PlayerService> init() async {
    box = GetStorage();

    // read from storage
    _curPlayingProgramId = box.read(CUR_PLAYING_PROGRAM) ?? -1;
    _curPlayingEpisodeId = box.read(CUR_PLAYING_EPISODE) ?? -1;

    // fill the play list

    // init video controller

    return this;
  }

  @override
  void onClose() {
    super.onClose();
    videoCtl?.dispose();
    _saveStorage();
    videoCtl!.removeListener(_onPlayerUpdate);
  }

  _saveStorage() async {
    await box.write(CUR_PLAYING_PROGRAM, _curPlayingProgramId);
    await box.write(CUR_PLAYING_EPISODE, _curPlayingEpisodeId);
  }

  Future<LoadResult> loadEpisode(EpisodeRecord episode) async {
    // download
    FileService fs = Get.find<FileService>();
    String mediaPath = await fs.download(episode.mediaSrc);
    AppCaption priSub = await AppCaption()
        .loadFromFile(await fs.download(episode.captions['en']!));
    AppCaption secSub = await AppCaption()
        .loadFromFile(await fs.download(episode.captions['cn']!));

    // init video player
    videoCtl?.dispose();
    videoCtl = VideoPlayerController.file(File(mediaPath));
    await videoCtl!.initialize();
    videoCtl!.addListener(_onPlayerUpdate);

    caption = priSub;

    LoadResult ret = LoadResult(priSub, secSub);
    return ret;
  }

  Future<void> initPlay() async {}

  void next() {
    // get next episode from play list

    // play next episode
  }

  void playNext(int programId, EpisodeRecord episode) async {
    // init video player
    videoCtl?.dispose();

    if (episode.mediaSrc.startsWith('http')) {
      videoCtl = VideoPlayerController.networkUrl(Uri.parse(episode.mediaSrc));
    } else if (episode.mediaSrc.startsWith('assets/')) {
      videoCtl = VideoPlayerController.asset(episode.mediaSrc);
    } else {
      videoCtl = VideoPlayerController.file(File(episode.mediaSrc));
    }

    videoCtl!.addListener(_onPlayerUpdate);

    // init subtitle
    caption.loadFromFile(episode.captions['en']!);
  }

  void play() {
    videoCtl?.play();
  }

  void pause() {
    videoCtl?.pause();
  }

  void nextSentence() {
    if (caption.isEmpty() || videoCtl == null) {
      return;
    }

    // calc seconds of next sentence from subtitles
    AppCaptionEntry se = caption.getNextLine(videoCtl!.value.position);
    videoCtl?.seekTo(se.start);
  }

  void preSentence() {
    // calc seconds of next sentence from subtitles
    AppCaptionEntry se = caption.getPreLine(videoCtl!.value.position);
    videoCtl?.seekTo(se.start);
  }

  void jumpToSentence(int sequence) {
    AppCaptionEntry se = caption.getLine(sequence);
    videoCtl?.seekTo(se.start);
  }

  set playSpeed(double speed) {}

  double get playSpeed {
    return 0;
  }

  void _onPlayerUpdate() {
    var videoDuration = videoCtl!.value.duration;
    AppCaptionEntry se = caption.getSubtitle(videoDuration);
    subtitleText.value = se.text;
    subtitleIndex.value = se.sequence;
    isPlaying.value = videoCtl!.value.isPlaying;
  }
}
