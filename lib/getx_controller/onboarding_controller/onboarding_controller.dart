import 'package:e_wast_app/ui/auth_screens/login_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs; // To track active page
  final PageController pageController = PageController();

  // Onboarding Content Data
  final List<Map<String, String>> onboardingPages = [
    {
      "title": "Recycle with Ease",
      "description": "Schedule e-waste pickups directly from your doorstep with just a few taps.",
      "image": "assets/onboard_1.png", // Tame ahiya Lottie files pan vapi shako
    },
    {
      "title": "Find Drop-off Zones",
      "description": "Locate the nearest certified e-waste recycling facilities on our interactive map.",
      "image": "assets/onboard_2.png",
    },
    {
      "title": "Earn Green Rewards",
      "description": "Collect Eco-Points for every successful recycle and redeem exciting vouchers.",
      "image": "assets/onboard_3.png",
    }
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < onboardingPages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        
      );

    } else {
      // Go to Login/Register Screen
      // Get.offAllNamed('/login');
      Get.off(LoginScreen());
    }
  }

  void skip() {
    // Direct skip to Login
    // Get.offAllNamed('/login');
    Get.off(LoginScreen());
  }
}