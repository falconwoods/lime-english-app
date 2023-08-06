import 'dart:convert';

import 'package:get/get.dart';
import 'package:lime_english/app/data/models/api_res.dart';
import 'package:lime_english/app/data/models/app_error.dart';
import 'package:lime_english/app/data/models/user.dart';
import 'package:lime_english/app/data/services/app_config_service.dart';
import 'package:lime_english/core/utils/functions/crypto_utils.dart';
import 'package:lime_english/core/utils/headers_api.dart';
import 'package:lime_english/core/values/env.dart';

class LimeApi extends GetConnect {
  late final AppConfigService _appCfg;

  LimeApi() {
    _appCfg = Get.find<AppConfigService>();
  }

  Map<String, String> getHeadersWithToken() {
    return HeadersAPI(apiKey: _appCfg!.userToken).getHeaders();
  }

  getWithToken<T>(
    String api, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) async {
    final res = await get('$apiServer',
        headers: getHeadersWithToken(), query: query, decoder: decoder);
    if (res.hasError) {
      return await handleError(res);
    }

    return res;
  }

  postWithToken<T>(
    String? api,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) async {
    final res = await post('$apiServer$api', body,
        contentType: contentType,
        headers: getHeadersWithToken(),
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress);

    if (res.hasError) {
      return await handleError(res);
    }
    return ApiResponse(res.statusCode, res.body);
  }

  handleError(Response<dynamic> res) async {
    if (res.statusCode == 401) {
      Get.snackbar('', 'invalid_auth'.tr);
      await Get.toNamed('/login');
    }
    return AppError(message: 'error', status: res.statusCode);
  }

  login(String username, String password) async {
    final res = await postWithToken(
      '/login',
      {
        'username': username.trim(),
        'password': hashPassword(password.trim(), ''),
      },
    );

    if (res.runtimeType == AppError) {
      return ApiResponse(res.status, res.message, null);
    }

    return ApiResponse(res.statuscode, '', res.body);
  }

  getUserInfo() async {
    final res = await getWithToken('/user');
    if (res.runtimeType == AppError) {
      return ApiResponse(res.status, res.message, null);
    }
    return ApiResponse(res.statuscode, '', User.fromJson(res.body));
  }
}
