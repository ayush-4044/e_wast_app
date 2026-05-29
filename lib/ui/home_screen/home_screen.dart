import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controller/home_controller/home_controller.dart';
import '../../utils/colors.dart';
import '../../utils/responsive_code/responsive_extensions.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      // AppBar with minimal design
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        toolbarHeight: 70.h,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning,",
              style: TextStyle(color: AppColors.textMuted, fontSize: 14.sp),
            ),
            Obx(
              () => Text(
                controller.userName.value,
                style: TextStyle(
                  color: AppColors.textMain,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: controller.profile,
              child: CircleAvatar(
                radius: 22.h,
                backgroundColor: AppColors.primaryLight.withOpacity(0.2),
                child: Icon(
                  Icons.person_outline,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Hero Impact Card
              _buildImpactCard(),

              SizedBox(height: 30.h),

              // 2. Quick Actions
              Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionCard(
                    title: "Schedule\nPickup",
                    icon: Icons.local_shipping_outlined,
                    color: AppColors.primary,
                    onTap: controller.schedulePickup,
                  ),
                  _buildActionCard(
                    title: "Find\nDrop-off",
                    icon: Icons.location_on_outlined,
                    color: Colors.blueAccent,
                    onTap: controller.openMapLocator,
                  ),
                  _buildActionCard(
                    title: "My\nRewards",
                    icon: Icons.emoji_events_outlined,
                    color: Colors.orangeAccent,
                    onTap: controller.myReward,
                  ),
                ],
              ),

              SizedBox(height: 35.h),

              // 3. E-Waste Guidelines or Recent Activity
              Text(
                "Recent Activity",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
              SizedBox(height: 16.h),
              _buildRecentActivityList(),
            ],
          ),
        ),
      ),
    );
  }

  // ==== WIDGET EXTRACTS FOR CLEAN CODE ====

  Widget _buildImpactCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Green Impact",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(Icons.eco_rounded, color: Colors.white, size: 24.sp),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Obx(
                () => Text(
                  "${controller.recycledWeight.value} kg",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "Recycled",
                style: TextStyle(color: Colors.white70, fontSize: 16.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Obx(
              () => Text(
                "🌟 ${controller.greenPoints.value} Green Points earned",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w, // Responsive width
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28.sp),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textMain,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivityList() {
    // Dummy Data for UI showcase
    return Column(
      children: [
        _activityTile(
          title: "Old Laptop Recycled",
          date: "24 May 2026",
          points: "+150",
          icon: Icons.laptop_mac,
        ),
        SizedBox(height: 12.h),
        _activityTile(
          title: "Smartphone Dropped",
          date: "10 May 2026",
          points: "+50",
          icon: Icons.smartphone,
        ),
        SizedBox(height: 12.h),
        _activityTile(
          title: "Account Created",
          date: "01 May 2026",
          points: "+10",
          icon: Icons.person_add_alt,
        ),
      ],
    );
  }

  Widget _activityTile({
    required String title,
    required String date,
    required String points,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primaryLight, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.textMain,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  date,
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12.sp),
                ),
              ],
            ),
          ),
          Text(
            points,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: AppColors.success,
            ),
          ),
        ],
      ),
    );
  }
}
