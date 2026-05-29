import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controller/profile_controller/profile_controller.dart';
import '../../utils/colors.dart';
import '../../utils/responsive_code/responsive_extensions.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Premium Overlapping Header
            _buildProfileHeader(),

            SizedBox(height: 10.h),

            // 2. Quick Stats Row
            _buildQuickStats(),

            SizedBox(height: 30.h),

            // 3. Settings Groups
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Account Settings", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.textMain)),
                  SizedBox(height: 16.h),
                  _buildSettingsCard([
                    _buildOptionTile(Icons.person_outline, "Personal Information", onTap: controller.editProfile),
                    _buildDivider(),
                    _buildOptionTile(Icons.location_on_outlined, "Saved Addresses", onTap: controller.manageAddresses),
                    _buildDivider(),
                    _buildOptionTile(Icons.history_rounded, "Pickup History", onTap: () {}),
                  ]),

                  SizedBox(height: 24.h),

                  Text("General", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.textMain)),
                  SizedBox(height: 16.h),
                  _buildSettingsCard([
                    _buildOptionTile(Icons.notifications_none_rounded, "Notifications", onTap: () {}),
                    _buildDivider(),
                    _buildOptionTile(Icons.help_outline_rounded, "Help & Support", onTap: () {}),
                    _buildDivider(),
                    _buildOptionTile(Icons.privacy_tip_outlined, "Privacy Policy", onTap: () {}),
                  ]),

                  SizedBox(height: 35.h),

                  // 4. Logout Button
                  OutlinedButton(
                    onPressed: controller.logout,
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 55.h),
                      side: const BorderSide(color: Colors.redAccent, width: 1.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout_rounded, color: Colors.redAccent, size: 22.sp),
                        SizedBox(width: 10.w),
                        Text(
                          "Log Out",
                          style: TextStyle(color: Colors.redAccent, fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // WIDGET EXTRACTS
  // ==========================================

  Widget _buildProfileHeader() {
    return SizedBox(
      height: 260.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Background Curved Gradient
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Text("My Profile", style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),

          // Profile Picture Floating
          Positioned(
            top: 130.h, // Overlaps the green and white areas
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.w), // White border effect
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: CircleAvatar(
                        radius: 50.w,
                        backgroundColor: AppColors.scaffoldBackground,
                        // Tame ahiya user ni actual image network thi muki shako
                        backgroundImage: const NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                      ),
                    ),
                    // Edit Icon Badge
                    GestureDetector(
                      onTap: controller.editProfile,
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColors.accent, // Tech blue accent
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(Icons.edit, color: Colors.white, size: 16.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                // Name and Email
                Obx(() => Text(
                  controller.userName.value,
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColors.textMain, letterSpacing: -0.5),
                )),
                SizedBox(height: 2.h),
                Obx(() => Text(
                  controller.userEmail.value,
                  style: TextStyle(fontSize: 14.sp, color: AppColors.textMuted),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Padding(
      padding: EdgeInsets.only(top: 80.h), // Spacing adjusted because of the floating avatar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _statBox("Pickups", controller.totalPickups.value.toString(), Icons.local_shipping_outlined, Colors.blue),
          SizedBox(width: 20.w),
          Container(width: 1.w, height: 40.h, color: AppColors.inputBorder), // Divider line
          SizedBox(width: 20.w),
          _statBox("Eco Points", controller.totalPoints.value.toString(), Icons.stars_rounded, const Color(0xFFFFD700)),
        ],
      ),
    );
  }

  Widget _statBox(String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20.sp),
            SizedBox(width: 6.w),
            Text(value, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.textMain)),
          ],
        ),
        SizedBox(height: 4.h),
        Text(label, style: TextStyle(fontSize: 12.sp, color: AppColors.textMuted)),
      ],
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildOptionTile(IconData icon, String title, {required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      leading: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColors.primaryLight.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.primary, size: 22.sp),
      ),
      title: Text(title, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: AppColors.textMain)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.textMuted),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1, color: AppColors.inputBorder.withOpacity(0.5), indent: 70.w, endIndent: 20.w);
  }
}