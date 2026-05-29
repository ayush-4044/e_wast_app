import 'package:flutter/material.dart';
import 'package:get/get.dart';import '../../getx_controller/schedule_controller/schedule_controller.dart';
import '../../utils/colors.dart';

import '../../utils/responsive_code/responsive_extensions.dart';


class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);

  final ScheduleController controller = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.textMain, size: 20.sp),
          onPressed: () => Get.back(),
        ),
        title: Text("Schedule Pickup", style: TextStyle(color: AppColors.textMain, fontWeight: FontWeight.bold, fontSize: 18.sp)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("What are you recycling?", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.textMain)),
              SizedBox(height: 12.h),

              // Dynamic Category Selection
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: controller.categories.map((category) => Obx(() {
                  bool isSelected = controller.selectedCategory.value == category;
                  return GestureDetector(
                    onTap: () => controller.selectCategory(category),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: isSelected ? AppColors.primary : AppColors.inputBorder),
                        boxShadow: isSelected ? [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))] : [],
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textMuted,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  );
                })).toList(),
              ),

              SizedBox(height: 32.h),
              Text("Preferred Date & Time", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.textMain)),
              SizedBox(height: 12.h),

              // Date Picker
              _buildPickerCard(
                icon: Icons.calendar_month_outlined,
                title: "Date",
                valueDisplay: Obx(() => Text(controller.selectedDate.value, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: AppColors.textMain))),
                onTap: () => controller.pickDate(context),
              ),
              SizedBox(height: 16.h),

              // Time Picker
              _buildPickerCard(
                icon: Icons.access_time_outlined,
                title: "Time",
                valueDisplay: Obx(() => Text(controller.selectedTime.value, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: AppColors.textMain))),
                onTap: () => controller.pickTime(context),
              ),

              SizedBox(height: 40.h),

              // Submit Button
              Obx(() => ElevatedButton(
                onPressed: controller.isLoading.value ? null : controller.submitRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: Size(double.infinity, 55.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                ),
                child: controller.isLoading.value
                    ? SizedBox(height: 24.h, width: 24.h, child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                    : Text("Confirm Pickup", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white)),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPickerCard({required IconData icon, required String title, required Widget valueDisplay, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.inputBorder),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(color: AppColors.primaryLight.withOpacity(0.1), shape: BoxShape.circle),
              child: Icon(icon, color: AppColors.primary, size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: AppColors.textMuted, fontSize: 12.sp)),
                  SizedBox(height: 4.h),
                  valueDisplay,
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.textMuted, size: 24.sp),
          ],
        ),
      ),
    );
  }
}