import 'package:lime_english/app/data/models/api_res.dart';
import 'package:lime_english/app/data/models/user.dart';
import 'package:lime_english/app/data/provider/api.dart';
import 'package:get/get.dart';
import 'package:lime_english/core/values/consts.dart';

class AuthService extends GetxService {
  late final LimeApi api;

  Future<AuthService> init() async {
    api = LimeApi();
    return this;
  }

  final user = User().obs;

  login(arg) async {
    ApiResponse res = await api.postWithToken(API_LOGIN, arg);
  }
}
