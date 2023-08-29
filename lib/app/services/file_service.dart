import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class FileService extends GetxService {
  final Dio _dio = Dio();

  static String getFileType(String path) {
    if (path.endsWith('.mp3')) {
      return 'audio';
    } else if (path.endsWith('.mp4')) {
      return 'video';
    } else if (path.endsWith('.srt')) {
      return 'subtitle';
    } else {
      return 'other';
    }
  }

  Future<FileService> init() async {
    return this;
  }

  // download file and return local file path
  Future<String> download(String url) async {
    String ft = getFileType(url);
    return _download(url, ft);
  }

  Future<String> _download(String url, subfolders) async {
    try {
      final docDir = await getApplicationDocumentsDirectory();
      String appDirPath = docDir.path;

      String saveDirPath = '$appDirPath/$subfolders';
      Directory saveDir = Directory(saveDirPath);
      if (!saveDir.existsSync()) {
        saveDir.createSync(recursive: true);
      }

      String filename = url.split('/').last;

      String filePath = '$saveDirPath/$filename';

      File file = File(filePath);

      bool fileExists = await file.exists();

      // TODO: local file may be damaged

      if (fileExists == false) {
        await _dio.download(url, filePath);
      }

      return filePath;
    } catch (e) {
      Get.log(e.toString(), isError: true);
      throw Exception(e.toString());
    }
  }
}
