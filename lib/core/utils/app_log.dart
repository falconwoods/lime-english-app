import 'package:logger/logger.dart';

class AppLog extends Logger {
  static late final AppLog? _instance;

  AppLog._();

  static AppLog get ins {
    _instance ??= AppLog._();
    return _instance!;
  }
}
