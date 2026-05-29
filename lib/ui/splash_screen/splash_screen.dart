import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controller/splash_controller/splash_controller.dart';
import '../../utils/colors.dart';
import '../../utils/responsive_code/responsive_extensions.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  // Initialize Controller
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Premium deep green background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Floating App Icon / Lottie Animation
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Icon(Icons.recycling_rounded, size: 80.sp, color: AppColors.primary),
            ),
            SizedBox(height: 24.h),

            // App Brand Name
            Text(
              "EcoWaste",
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8.h),

            // Tagline
            Text(
              "Recycle Smart. Live Green.",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white70,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}