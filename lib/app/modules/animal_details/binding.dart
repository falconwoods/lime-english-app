import 'package:lime_english/app/data/provider/api.dart';
import 'package:lime_english/app/modules/animal_details/controller.dart';
import 'package:lime_english/app/modules/animal_details/repository.dart';
import 'package:get/get.dart';

class AnimalDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimalDetailsController>(
        () => AnimalDetailsController(AnimalDetailsRepository(LimeApi())));
  }
}
