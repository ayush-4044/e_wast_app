import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/auth/registration_api.dart';
import '../../utils/colors.dart';


class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // 1. 'late' keyword
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  var isLoading = false.obs;

  // 2. onInit ma initialize
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      final result = await ApiService.registerUser(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        number: phoneController.text.trim()
      );

      isLoading.value = false;

      if (result['success'] == true) {
        Get.snackbar(
          "Success",
          result['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.success.withOpacity(0.9),
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          icon: const Icon(Icons.check_circle, color: Colors.white),
        );
      } else {
        Get.snackbar(
          "Registration Failed",
          result['message'] ?? "Something went wrong",
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
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../api/auth/registration_api.dart';
// import '../../utils/colors.dart';
//
//
// class AuthController extends GetxController {
//   // Form Key & Controllers
//   final formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final phoneController = TextEditingController();
//
//   // Reactive Loading State
//   var isLoading = false.obs;
//
//   @override
//   void onClose() {
//     // Memory management: Clean up controllers when screen is closed
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     phoneController.dispose();
//     super.onClose();
//   }
//
//   Future<void> register() async {
//     if (formKey.currentState!.validate()) {
//       isLoading.value = true; // Show loading indicator
//
//       final result = await ApiService.registerUser(
//         name: nameController.text.trim(),
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//         number : phoneController.text.trim(),
//       );
//
//       isLoading.value = false; // Hide loading indicator
//
//       if (result['success'] == true) {
//         Get.snackbar(
//           "Success",
//           result['message'],
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: AppColors.success.withOpacity(0.9),
//           colorText: Colors.white,
//           margin: const EdgeInsets.all(16),
//           icon: const Icon(Icons.check_circle, color: Colors.white),
//         );
//
//         // Future navigation code: Get.offAllNamed('/login');
//       } else {
//         Get.snackbar(
//           "Registration Failed",
//           result['message'] ?? "Something went wrong",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: AppColors.error.withOpacity(0.9),
//           colorText: Colors.white,
//           margin: const EdgeInsets.all(16),
//           icon: const Icon(Icons.error_outline, color: Colors.white),
//         );
//       }
//     }
//   }
// }