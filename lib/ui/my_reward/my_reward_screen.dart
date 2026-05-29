import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controller/reward_controller/reward_controller.dart';
import '../../utils/colors.dart';
import '../../utils/responsive_code/responsive_extensions.dart';


class RewardsScreen extends StatelessWidget {
  RewardsScreen({Key? key}) : super(key: key);

  final RewardsController controller = Get.put(RewardsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Premium Hero Header (Points & Tier)
            _buildHeroHeader(),

            SizedBox(height: 30.h),

            // 2. Redeem Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Redeem Rewards", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.textMain)),
                  Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.textMuted),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Horizontal Scrolling Reward Cards
            SizedBox(
              height: 180.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.availableRewards.length,
                itemBuilder: (context, index) {
                  var reward = controller.availableRewards[index];
                  return _buildRewardCard(reward);
                },
              ),
            ),

            SizedBox(height: 35.h),

            // 3. Earning History
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text("Recent History", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.textMain)),
            ),
            SizedBox(height: 16.h),
            _buildHistoryList(),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // WIDGET EXTRACTS
  // ==========================================

  Widget _buildHeroHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 60.h, left: 24.w, right: 24.w, bottom: 30.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF004D40), Color(0xFF00695C)], // Deep Forest Green to Teal
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Stack( // Background ma decorative shapes mate stack
        clipBehavior: Clip.none,
        children: [
          // Background Blob
          Positioned(
            right: -50.w,
            top: -20.h,
            child: CircleAvatar(radius: 60.w, backgroundColor: Colors.white.withOpacity(0.05)),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button & Title
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text("My Rewards", style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 30.h),

              // Total Points Display
              Text("Total Green Points", style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.stars_rounded, color: const Color(0xFFFFD700), size: 40.sp), // Gold Star
                  SizedBox(width: 8.w),
                  Obx(() => Text(
                    "${controller.totalPoints.value}",
                    style: TextStyle(color: Colors.white, fontSize: 42.sp, fontWeight: FontWeight.bold, height: 1.0),
                  )),
                  SizedBox(width: 8.w),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.h),
                    child: Text("pts", style: TextStyle(color: Colors.white70, fontSize: 18.sp, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              // Tier Progress Bar
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(controller.currentTier.value, style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.bold))),
                        Obx(() => Text("Next: ${controller.nextTier.value}", style: TextStyle(color: Colors.white70, fontSize: 12.sp))),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Obx(() => LinearProgressIndicator(
                        value: controller.tierProgress.value,
                        minHeight: 8.h,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD700)), // Gold progress
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRewardCard(Map<String, dynamic> reward) {
    return GestureDetector(
      onTap: () => controller.redeemReward(reward["points"], reward["title"]),
      child: Container(
        width: 160.w,
        margin: EdgeInsets.only(right: 16.w, bottom: 10.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(reward["color1"]), Color(reward["color2"])],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Color(reward["color1"]).withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 5)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
              child: Icon(Icons.card_giftcard_rounded, color: Colors.white, size: 26.sp),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reward["title"],
                  style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold, height: 1.2),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "${reward["points"]} pts",
                    style: TextStyle(color: Color(reward["color2"]), fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          _historyTile("Old Laptop Recycled", "24 May 2026", "+150", true),
          SizedBox(height: 12.h),
          _historyTile("Amazon Voucher Redeemed", "20 May 2026", "-500", false),
          SizedBox(height: 12.h),
          _historyTile("Smartphone Dropped", "10 May 2026", "+50", true),
        ],
      ),
    );
  }

  Widget _historyTile(String title, String date, String points, bool isPositive) {
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
              color: isPositive ? AppColors.primaryLight.withOpacity(0.1) : Colors.redAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isPositive ? Icons.add_circle_outline : Icons.remove_circle_outline,
              color: isPositive ? AppColors.primary : Colors.redAccent,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp, color: AppColors.textMain)),
                SizedBox(height: 4.h),
                Text(date, style: TextStyle(color: AppColors.textMuted, fontSize: 12.sp)),
              ],
            ),
          ),
          Text(
            points,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: isPositive ? AppColors.success : Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}