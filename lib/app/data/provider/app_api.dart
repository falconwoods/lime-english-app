import 'package:lime_english/app/data/provider/base_api.dart';
import 'package:lime_english/core/utils/functions/crypto_utils.dart';
import 'package:lime_english/core/values/consts.dart';

class AppApi extends BaseAPI {
  login(String username, String password) async {
    final res = await postAuth(
        API_LOGIN,
        {
          'username': username.trim(),
          'password': hashPassword(password.trim(), ''),
        },
        auth: false);

    return res;
  }

  signUp(String email, String password) {
    final res = postAuth(API_SIGN_UP, {
      'email': email.trim(),
      'password': hashPassword(password.trim(), ''),
    });

    return res;
  }

  getUserInfo() async {
    final res = await getAuth(API_USER);
    return res;
  }
}
