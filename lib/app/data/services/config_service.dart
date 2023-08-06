import 'package:lime_english/core/values/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppConfigService extends GetxService {
  late GetStorage box;

  String _userToken = '';
  bool _darkMode = false;

  Future<AppConfigService> init() async {
    box = GetStorage();

    _userToken = box.read(USER_TOKEN) ?? '';
    _darkMode = box.read(DARK_MODE) ?? false;

    return this;
  }

  String get userToken {
    return _userToken;
  }

  set userToken(String token) {
    _userToken = token;
    box.write(USER_TOKEN, token);
  }

  bool get darkMode {
    return _darkMode;
  }

  set darkMode(bool val) {
    _darkMode = val;
    box.write(DARK_MODE, val);
    Get.changeThemeMode(val ? ThemeMode.dark : ThemeMode.light);
    Get.changeTheme(val ? ThemeData.dark() : ThemeData.light());
  }
}
