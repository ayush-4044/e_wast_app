import 'package:e_wast_app/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controller/onboarding_controller/onboarding_controller.dart';
import '../../utils/colors.dart';
import '../../utils/responsive_code/responsive_extensions.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button at Top Right
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: controller.skip,
                child: Text(
                  "Skip",
                  style: TextStyle(color: AppColors.textMuted, fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            // Swipeable Pages
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingPages.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Pro-Tip: Ahiya image ni jagya e Lottie widget add kari shakay (e.g. Lottie.asset(...))
                        Container(
                          height: 280.h,
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.phonelink_setup_rounded, size: 120.sp, color: AppColors.primary),
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Text(
                          controller.onboardingPages[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textMain,
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          controller.onboardingPages[index]["description"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.textMuted,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Action Bar (Dots & Button)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dynamic Dot Indicators
                  Row(
                    children: List.generate(
                      controller.onboardingPages.length,
                          (index) => Obx(() => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.only(right: 8.w),
                        height: 8.h,
                        width: controller.currentPage.value == index ? 24.w : 8.w,
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == index ? AppColors.primary : AppColors.inputBorder,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )),
                    ),
                  ),

                  // Next / Get Started Button
                  Obx(() => GestureDetector(
                    onTap: controller.nextPage,
                    child: BouncingElevatedWrapper(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(
                          horizontal: controller.currentPage.value == controller.onboardingPages.length - 1 ? 24.w : 16.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 5))
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (controller.currentPage.value == controller.onboardingPages.length - 1)
                              Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                                ),
                              ),
                            Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20.sp),
                          ],
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}