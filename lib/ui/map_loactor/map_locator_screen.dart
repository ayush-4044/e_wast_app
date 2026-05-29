import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controller/maplocator_controller/map_controller.dart';
import '../../utils/colors.dart';
import '../../utils/responsive_code/responsive_extensions.dart';


class MapLocatorScreen extends StatelessWidget {
  MapLocatorScreen({Key? key}) : super(key: key);

  final MapLocatorController controller = Get.put(MapLocatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0), // Typical map loading background color
      body: Stack(
        children: [
          // 1. Map Layer (Replace this Container with GoogleMap widget later)
          Obx(() {
            if (controller.isMapLoading.value) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(color: AppColors.primary),
                    SizedBox(height: 16.h),
                    Text("Locating nearest facilities...", style: TextStyle(color: AppColors.textMuted, fontSize: 14.sp)),
                  ],
                ),
              );
            }
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              // MOCK MAP IMAGE OR GOOGLE MAP WIDGET GOES HERE
              child: Image.network(
                'https://www.google.com/maps/d/thumbnail?mid=1a0P248Iq1Wqf5L8C9w-9z920k9s&hl=en_US',
                fit: BoxFit.cover,
                color: Colors.white.withOpacity(0.4),
                colorBlendMode: BlendMode.lighten,
              ),
            );
          }),

          // 2. Floating Top Bar
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
                      child: Icon(Icons.arrow_back_ios_new, size: 20.sp, color: AppColors.textMain),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: AppColors.textMuted, size: 22.sp),
                          SizedBox(width: 10.w),
                          Text("Search e-waste centers...", style: TextStyle(color: AppColors.textMuted, fontSize: 14.sp)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. Floating Bottom Facility Info Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(() {
              if (controller.isMapLoading.value) return const SizedBox.shrink();
              return Container(
                margin: EdgeInsets.all(20.w),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(color: AppColors.primaryLight.withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
                          child: Icon(Icons.recycling_rounded, color: AppColors.primary, size: 30.sp),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.selectedCenter.value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp, color: AppColors.textMain)),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Icon(Icons.location_on, color: Colors.redAccent, size: 14.sp),
                                  SizedBox(width: 4.w),
                                  Text(controller.centerDistance.value, style: TextStyle(color: AppColors.textMuted, fontSize: 13.sp)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              side: BorderSide(color: AppColors.primary),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Text("Details", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: controller.openDirections,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Text("Directions", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}