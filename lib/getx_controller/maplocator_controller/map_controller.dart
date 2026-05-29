import 'package:get/get.dart';

class MapLocatorController extends GetxController {
  // Pro-level: Handle location loading state
  var isMapLoading = true.obs;
  var selectedCenter = "GreenTech Recycling Hub".obs;
  var centerDistance = "2.5 km away".obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate map initialization delay
    Future.delayed(const Duration(seconds: 2), () {
      isMapLoading.value = false;
    });
  }

  void openDirections() {
    Get.snackbar("Navigation", "Opening directions to ${selectedCenter.value}...");
  }
}