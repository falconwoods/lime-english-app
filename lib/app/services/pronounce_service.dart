import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class PronounceService extends GetxService {
  final FlutterTts flutterTts = FlutterTts();

  Future<PronounceService> init() async {
    if (Platform.isIOS) {
      await flutterTts.setSharedInstance(true);
      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.awaitSynthCompletion(true);

      // await flutterTts.setIosAudioCategory(
      //     IosTextToSpeechAudioCategory.ambient,
      //     [
      //       IosTextToSpeechAudioCategoryOptions.allowBluetooth,
      //       IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
      //       IosTextToSpeechAudioCategoryOptions.mixWithOthers
      //     ],
      //     IosTextToSpeechAudioMode.voicePrompt);
    }
    await flutterTts.setVoice({"name": "Karen", "locale": "en-GB"});
    await setLanguage('en-GB');
    return this;
  }

  Future<void> setLanguage(String lang) async {
    // 'en-GB' 'en-US'
    await flutterTts.setLanguage(lang);
  }

  Future<void> pronounce(String vocab) async {
    await flutterTts.speak(vocab);
  }
}
