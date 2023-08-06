import 'package:flutter_dotenv/flutter_dotenv.dart';

final apiServer = dotenv.env['API_SERVER'];
final resServer = dotenv.env['RES_SERVER'];

String getEnv(String key) {
  return dotenv.env[key] ?? '';
}
