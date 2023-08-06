import 'dart:convert';

import 'package:crypto/crypto.dart';

String hashPassword(String password, String salt) {
  var bytes = utf8.encode(password + salt);
  var hashedPassword = sha256.convert(bytes);
  return hashedPassword.toString();
}
