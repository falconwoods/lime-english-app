import 'package:get/get.dart';
import 'package:lime_english/app/data/enum/subtitle_option.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_arg.dart';
import 'package:lime_english/app/services/file_service.dart';
import 'package:lime_english/app/services/player/Subtitle.dart';

class ListeningController extends GetxController {
  late final ListeningArg arg;
  late final Future<void> initFuture;
  final isDownloading = false.obs;
  final _mediaPath = ''.obs;
  final Rx<SubtitleOption> subtitleOption = SubtitleOption.all.obs;
  // final Rx<Map<String, Subtitle>> _subtitles = Rx<Map<String, Subtitle>>({});
  late final Subtitle primarySubtitle;
  late final Subtitle secondarySubtitle;

  ListeningController(this.arg);

  @override
  void onInit() {
    super.onInit();
    initFuture = _init();
  }

  Future<void> _init() async {
    // download video and subtitles
    FileService fs = Get.find<FileService>();
    _mediaPath.value = await fs.download(arg.episode.mediaSrc);

    // for (var subtitle in arg.episode.subtitles.entries) {
    //   var sp = await fs.download(subtitle.value);
    //   _subtitles.value[subtitle.key] = await Subtitle().loadFromFile(sp);
    // }

    if (!arg.episode.subtitles.containsKey('en') ||
        !arg.episode.subtitles.containsKey('cn')) {
      throw 'Subtitles not found';
    }
    primarySubtitle =
        await Subtitle().loadFromFile(arg.episode.subtitles['en']!);
    primarySubtitle =
        await Subtitle().loadFromFile(arg.episode.subtitles['cn']!);
  }
}
