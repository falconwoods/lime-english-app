import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  final List<String> lans = ["zh_CN"];
  Map<String, Map<String, String>> data = <String, Map<String, String>>{};

  @override
  Map<String, Map<String, String>> get keys => data;

  Future<AppTranslations> load() async {
    for (String lan in lans) {
      final String jsonString =
          await rootBundle.loadString('assets/translations/$lan.json');

      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      final localizedStrings =
          jsonMap.map((key, value) => MapEntry(key, value.toString()));

      data[lan] = localizedStrings;
    }

    print(data.toString());

    return this;
  }
}
