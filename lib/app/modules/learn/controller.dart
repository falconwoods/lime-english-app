import 'package:get/get.dart';
import 'package:lime_english/app/data/fake_data.dart';

class LearnController extends GetxController {
  final count = 0.obs;
  final recentUpdates = [].obs;
  final hotPrograms = [].obs;

  @override
  void onInit() {
    recentUpdates.value = FakeData.recentUpdate;
    hotPrograms.value = FakeData.hotPrograms;
    super.onInit();
  }
}
