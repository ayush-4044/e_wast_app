import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Reactive User Data
  var userName = "Ayush Hirapara".obs;
  var userEmail = "Ayush@gmail.com".obs;
  var userTier = "Gold Eco-Warrior".obs;

  // Stats
  var totalPickups = 12.obs;
  var totalPoints = 1250.obs;

  void editProfile() {
    Get.snackbar("Edit Profile", "Opening edit screen...");
  }

  void manageAddresses() {
    Get.snackbar("My Addresses", "Opening address manager...");
  }

  void logout() {
    // Ahiya tamare shared preferences mathi token clear karvanu logic aavse
    Get.defaultDialog(
        title: "Logout",
        middleText: "Are you sure you want to log out?",
        textConfirm: "Yes, Logout",
        textCancel: "Cancel",
        confirmTextColor: Colors.white,
        buttonColor: const Color(0xFFEF4444), // Red Color
        cancelTextColor: const Color(0xFF1A1A1A),
        onConfirm: () {
          Get.back(); // Close Dialog
          Get.snackbar("Logged Out", "You have been successfully logged out.");
          // Get.offAllNamed('/login'); // Navigate to Login
        }
    );
  }
}