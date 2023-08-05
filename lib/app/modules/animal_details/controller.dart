import 'package:lime_english/app/data/models/animals.dart';
import 'package:lime_english/app/data/models/breed_animal.dart';
import 'package:lime_english/app/modules/animal_details/repository.dart';
import 'package:lime_english/core/utils/functions/verify_response.dart';
import 'package:get/get.dart';

class AnimalDetailsController extends GetxController {
  final AnimalDetailsRepository repository;
  AnimalDetailsController(this.repository);
  final animal = Animals().obs;
  final breeds = BreedAnimal().obs;
  @override
  void onInit() {
    animal.value = Get.arguments;
    super.onInit();
  }
}
