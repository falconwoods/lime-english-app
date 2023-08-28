// ignore_for_file: constant_identifier_names

// key for storage
const DARK_MODE = 'dark_mode';
const USER_TOKEN = 'user_token';
const CUR_PLAYING_PROGRAM = 'cur_playing_program';
const CUR_PLAYING_EPISODE = 'cur_playing_episode';

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
