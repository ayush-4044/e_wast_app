import 'package:get/get.dart';

import '../../ui/onboarding_screen/onboarding_screens.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.offAll(() => OnboardingScreen());
  }
}