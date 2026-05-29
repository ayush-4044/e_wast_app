import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RewardsController extends GetxController {
  // Reactive State
  var totalPoints = 1250.obs;
  var currentTier = "Silver Eco-Warrior".obs;
  var nextTier = "Gold".obs;
  var tierProgress = 0.65.obs; // 65% complete

  // Mock Rewards List
  final List<Map<String, dynamic>> availableRewards = [
    {
      "title": "Amazon ₹500 Voucher",
      "points": 1000,
      "icon": "assets/gift.png",
      "color1": 0xFFF59E0B,
      "color2": 0xFFD97706,
    },
    {
      "title": "Plant 1 Tree on your name",
      "points": 500,
      "icon": "assets/tree.png",
      "color1": 0xFF10B981, // Emerald Green Gradient
      "color2": 0xFF047857,
    },
    {
      "title": "20% Off on Boat Earbuds",
      "points": 800,
      "icon": "assets/discount.png",
      "color1": 0xFF3B82F6, // Blue Gradient
      "color2": 0xFF1D4ED8,
    }
  ];

  void redeemReward(int pointsRequired, String rewardName) {
    if (totalPoints.value >= pointsRequired) {
      totalPoints.value -= pointsRequired;
      Get.snackbar(
        "🎉 Reward Unlocked!",
        "You successfully redeemed: $rewardName",
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFF10B981).withOpacity(0.9), // Success Green
        colorText: const Color(0xFFFFFFFF),
        margin: const EdgeInsets.all(16),
      );
    } else {
      Get.snackbar(
        "Not Enough Points",
        "You need ${pointsRequired - totalPoints.value} more points.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFFEF4444).withOpacity(0.9), // Error Red
        colorText: const Color(0xFFFFFFFF),
        margin: const EdgeInsets.all(16),
      );
    }
  }
}