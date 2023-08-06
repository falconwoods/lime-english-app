// ignore_for_file: constant_identifier_names

// key for storage
const DARK_MODE = 'dark_mode';
const USER_TOKEN = 'user_token';

// key for api
const API_LOGIN = '/login';
const API_SIGN_UP = '/signup';
const API_USER = '/user';
const API_USER_LOGOUT = '/logout';
const API_USER_UPDATE = '/update';

// path
const IMAGES = 'assets/images/';

getImgPath(String name) {
  return IMAGES + name;
}
