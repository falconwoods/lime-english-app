import 'package:lime_english/app/data/models/user.dart';
import 'package:lime_english/app/data/provider/api.dart';
import 'package:lime_english/app/data/services/auth/repository.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  late AuthRepository repository;
  Future<AuthService> init() async {
    repository = AuthRepository(MyApi());
    return this;
  }

  final user = User().obs;

  login(_) async => await repository.login(_);
}
