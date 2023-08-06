import 'package:get/get.dart';
import 'package:lime_english/app/data/models/api_res.dart';
import 'package:lime_english/app/data/services/config_service.dart';
import 'package:lime_english/core/utils/app_log.dart';
import 'package:lime_english/core/values/env.dart';

abstract class BaseAPI extends GetConnect {
  late final AppConfigService _appCfg;

  BaseAPI() {
    _appCfg = Get.find<AppConfigService>();
  }

  getAuth<T>(String api, {Map<String, dynamic>? query, bool auth = true}) async {
    final res = await get('$apiServer', headers: getHeaders(auth), query: query);
    return await processRes(res);
  }

  postAuth(String api, dynamic data, {bool auth = true}) async {
    final res = await post(
      '$apiServer$api',
      data,
      headers: getHeaders(auth),
    );

    return await processRes(res);
  }

  Future<ApiResponse> processRes(Response res) async {
    final apiRes = ApiResponse(res);

    if (res.hasError) {
      await handleHttpError(res);
    } else if (apiRes.hasError) {
      handleLogicError(apiRes);
    }

    return apiRes;
  }

  handleHttpError(Response<dynamic> res) async {
    AppLog.ins.w('http error ${res.statusCode}');
    if (res.unauthorized) {
      Get.snackbar('auth', res.statusText ?? 'invalid auth');
      await Get.toNamed('/login');
    } else if (res.status.isServerError) {
      Get.snackbar('server', res.statusText ?? 'server error');
    } else {
      Get.snackbar('network', res.statusText ?? 'connection error');
    }
  }

  handleLogicError(ApiResponse res) async {
    if (res.isOk) return;
    AppLog.ins.w(res.message);
    Get.snackbar('error', res.message);
  }

  // Helper
  Map<String, String> getHeaders(bool auth) {
    return getAPIHeaders(auth ? _appCfg.userToken : '');
  }

  Map<String, String> getAPIHeaders(String apiKey) {
    var headers = {"Content-Type": "application/json", "Accept-Charset": "UTF-8"};
    if (apiKey.isNotEmpty) {
      headers['Authorization'] = 'Bearer $apiKey';
    }
    return headers;
  }
}
