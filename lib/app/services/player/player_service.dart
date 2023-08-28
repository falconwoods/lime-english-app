import 'dart:io';

import 'package:lime_english/app/services/player/Subtitle.dart';
import 'package:lime_english/core/values/consts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';

class PlayerArg {
  late final String src;
  late final ResourceType srcType;
  late final String subtitle;
  late final ResourceType subtitleType;

  PlayerArg(
      {required this.src,
      required this.srcType,
      required this.subtitle,
      required this.subtitleType});
}

enum ResourceType { network, asset, file }

class PlayerService extends GetxService {
  late GetStorage box;

  // storage vars
  int _curPlayingProgramId = -1;
  int _curPlayingEpisodeId = -1;

  // subtitle
  Subtitle subtitle = Subtitle();
  var subtitleText = ''.obs;
  var subtitleIndex = 0.obs;

  VideoPlayerController? _videoPlayerController;

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
    _videoPlayerController?.dispose();
    _saveStorage();
    super.onClose();
  }

  _saveStorage() async {
    await box.write(CUR_PLAYING_PROGRAM, _curPlayingProgramId);
    await box.write(CUR_PLAYING_EPISODE, _curPlayingEpisodeId);
  }

  void next() {
    // get next episode from play list

    // play next episode
  }

  void playNext(PlayerArg arg) async {
    // init video player
    _videoPlayerController?.dispose();

    if (arg.srcType == ResourceType.network) {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(arg.src));
    } else if (arg.srcType == ResourceType.asset) {
      _videoPlayerController = VideoPlayerController.asset(arg.src);
    } else {
      _videoPlayerController = VideoPlayerController.file(File(arg.src));
    }

    _videoPlayerController?.addListener(_onPlayerUpdate);

    // init subtitle

    subtitle.loadFromFile(arg.subtitle);
  }

  void play() {
    _videoPlayerController?.play();
  }

  void pause() {
    _videoPlayerController?.pause();
  }

  void nextSentence() {
    if (subtitle.isEmpty() || _videoPlayerController == null) {
      return;
    }

    // calc seconds of next sentence from subtitles
    SubtitleEntry se =
        subtitle.getNextLine(_videoPlayerController!.value.position);
    _videoPlayerController?.seekTo(se.start);
  }

  void preSentence() {
    // calc seconds of next sentence from subtitles
    SubtitleEntry se =
        subtitle.getPreLine(_videoPlayerController!.value.position);
    _videoPlayerController?.seekTo(se.start);
  }

  set playSpeed(double speed) {}

  double get playSpeed {
    return 0;
  }

  void _onPlayerUpdate() {
    var videoDuration = _videoPlayerController!.value.duration;
    SubtitleEntry se = subtitle.getSubtitle(videoDuration);
    subtitleText.value = se.text;
    subtitleIndex.value = se.index;
  }
}
