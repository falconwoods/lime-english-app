import 'package:get/get.dart';
import 'package:lime_english/app/modules/learn/repository.dart';

class LearnController extends GetxController {
  final LearnRepository repository;
  LearnController(this.repository);

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
