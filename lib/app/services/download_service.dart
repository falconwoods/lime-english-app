import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class DownloadService extends GetxService {
  final Dio _dio = Dio();

  Future<DownloadService> init() async {
    return this;
  }

  Future<String?> downloadVideo(String url) async {
    return download(url, 'video');
  }

  Future<String?> downloadSubtitle(String url) async {
    return download(url, 'subtitle');
  }

  Future<String?> download(String url, subfolders) async {
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
      return null;
    }
  }
}
