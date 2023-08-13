import 'package:get/get.dart';
import 'package:lime_english/app/data/fake_data.dart';

class LearnController extends GetxController {
  final count = 0.obs;
  final recentUpdates = [].obs;

  @override
  void onInit() {
    recentUpdates.value = FakeData.recentUpdate;
    super.onInit();
  }
}
