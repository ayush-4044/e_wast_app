import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  var selectedCategory = "Laptops & PCs".obs;
  var selectedDate = "Select Date".obs;
  var selectedTime = "Select Time".obs;
  var isLoading = false.obs;

  final List<String> categories = [
    "Laptops & PCs",
    "Smartphones",
    "Home Appliances",
    "Batteries & Cables"
  ];

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      selectedDate.value = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      selectedTime.value = picked.format(context);
    }
  }

  void submitRequest() {
    if (selectedDate.value == "Select Date" || selectedTime.value == "Select Time") {
      Get.snackbar("Error", "Please select both date and time.",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    isLoading.value = true;

    // Mock API Delay
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar(
        "Success",
        "Pickup scheduled for ${selectedDate.value} at ${selectedTime.value}",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.back(); // Go back to Home
    });
  }
}