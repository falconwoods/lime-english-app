import 'package:get/get.dart';

class LearnController extends GetxController {
  LearnController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
