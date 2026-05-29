import 'package:e_wast_app/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/auth/registration_api.dart';
import '../../utils/colors.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  // UI mathi email and password ahiya aavse
  Future<void> login(String email, String password) async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      final result = await ApiService.loginUser(
        name: "", // Login ma mostly name jaruri nathi hotu
        email: email.trim(),
        password: password.trim(),
      );

      isLoading.value = false;

      if (result['success'] == true) {
        String token = result['token'];

        Get.snackbar(
          "Welcome Back!",
          result['message'] ?? "Logged in successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.success.withOpacity(0.9),
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          icon: const Icon(Icons.check_circle, color: Colors.white),
        );

        Get.offAll(() => HomeScreen()); // Use Get.offAll to clear previous screens
      } else {
        Get.snackbar(
          "Login Failed",
          result['message'] ?? "Invalid credentials",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error.withOpacity(0.9),
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          icon: const Icon(Icons.error_outline, color: Colors.white),
        );
      }
    }
  }
}