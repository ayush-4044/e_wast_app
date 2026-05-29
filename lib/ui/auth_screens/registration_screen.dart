// import 'package:e_wast_app/ui/auth_screens/login_screens.dart';
// import 'package:e_wast_app/utils/button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../getx_controller/auth_controller/registration_controller.dart';
// import '../../utils/colors.dart';
// import '../../utils/custom_text_filed.dart';
// import '../../utils/responsive_code/responsive_extensions.dart';
//
// class RegistrationScreen extends StatelessWidget {
//   RegistrationScreen({Key? key}) : super(key: key);
//
//   final AuthController controller = Get.put(AuthController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldBackground,
//       body: SafeArea(
//         child: Center( // Center for tablet/iPad views
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 600), // Tablet ma form bau lambu na thay e mate
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h), // Responsive Padding
//               child: Form(
//                 key: controller.formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.recycling_rounded, size: 80.h, color: AppColors.primary), // Responsive Icon Size
//                     SizedBox(height: 16.h),
//                     Text(
//                       "Join the Green Revolution",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 26.sp, // Responsive Font
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.textMain,
//                         letterSpacing: -0.5,
//                       ),
//                     ),
//                     SizedBox(height: 8.h),
//                     Text(
//                       "Register to start recycling e-waste smartly.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 15.sp, // Responsive Font
//                           color: AppColors.textMuted
//                       ),
//                     ),
//                     SizedBox(height: 40.h), // Responsive Spacing
//
//                     CustomTextField(
//                       controller: controller.nameController,
//                       hintText: "Full Name",
//                       icon: Icons.person_outline,
//                       validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
//                     ),
//                     CustomTextField(
//                       controller: controller.emailController,
//                       hintText: "Email Address",
//                       icon: Icons.email_outlined,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) return 'Please enter your email';
//                         if (!value.contains('@')) return 'Enter a valid email';
//                         return null;
//                       },
//                     ),
//                     CustomTextField(
//                       controller: controller.passwordController,
//                       hintText: "Password",
//                       icon: Icons.lock_outline,
//                       isPassword: true,
//                       validator: (value) => value!.length < 6 ? 'Password must be at least 6 characters' : null,
//                     ),
//
//                     CustomTextField(
//                       controller: controller.phoneController,
//                       hintText: "Phone",
//                       maxLength: 10,
//                       icon: Icons.phone,
//                       isPassword: false,
//                       validator: (value) => value!.length < 10 ? 'Phone must be at least 10 characters' : null,
//                     ),
//
//                     SizedBox(height: 24.h), // Responsive Spacing
//
//                     Obx(() => BouncingElevatedWrapper(
//                       child: ElevatedButton(
//                         onPressed: controller.isLoading.value ? null : controller.register,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primary,
//                           padding: EdgeInsets.symmetric(vertical: 18.h), // Responsive Button Padding
//                           elevation: 0,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           disabledBackgroundColor: AppColors.primaryLight,
//                         ),
//                         child: controller.isLoading.value
//                             ? SizedBox(
//                           height: 24.h, // Responsive Progress Indicator Size
//                           width: 24.h,
//                           child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
//                         )
//                             : Text(
//                           "Create Account",
//                           style: TextStyle(
//                               fontSize: 16.sp, // Responsive Font
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white
//                           ),
//                         ),
//                       ),
//                     )),
//
//                     SizedBox(height: 20.h),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Already have an account? ",
//                             style: TextStyle(color: AppColors.textMuted, fontSize: 14.sp)
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(LoginScreen());
//                           },
//                           child: Text(
//                             "Log In",
//                             style: TextStyle(
//                                 color: AppColors.primary,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14.sp
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:e_wast_app/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controller/auth_controller/registration_controller.dart';
import '../../utils/colors.dart';
import '../../utils/custom_text_filed.dart';
import '../../utils/responsive_code/responsive_extensions.dart';


class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  final AuthController controller = Get.put(AuthController());
  final RxBool _isPasswordHidden = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        children: [
          // Background Decorative Shape 1
          Positioned(
            top: -100.h,
            right: -100.w,
            child: Container(
              height: 300.h,
              width: 300.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.08),
              ),
            ),
          ),

          // Background Decorative Shape 2
          Positioned(
            bottom: -50.h,
            left: -50.w,
            child: Container(
              height: 200.h,
              width: 200.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryLight.withOpacity(0.05),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 550),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20.h),
                        // Premium Brand Section
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.1),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Icon(Icons.recycling_rounded, size: 50.h, color: AppColors.primary),
                          ),
                        ),
                        SizedBox(height: 24.h),

                        Text(
                          "Create Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textMain,
                            letterSpacing: -0.8,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Manage your e-waste responsibly and efficiently",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.sp, color: AppColors.textMuted),
                        ),
                        SizedBox(height: 36.h),

                        // Main Form Card
                        Container(
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 30,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: controller.nameController,
                                hintText: "Full Name",
                                icon: Icons.person_outline,
                                validator: (value) => value!.isEmpty ? 'Name required' : null,
                              ),
                              CustomTextField(
                                controller: controller.emailController,
                                hintText: "Email Address",
                                icon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) return 'Email required';
                                  if (!value.contains('@')) return 'Enter valid email';
                                  return null;
                                },
                              ),

                              // Advanced Password Field with Toggle
                              Obx(() => CustomTextField(
                                controller: controller.passwordController,
                                hintText: "Password",
                                icon: Icons.lock_outline,
                                isPassword: _isPasswordHidden.value,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordHidden.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                    color: AppColors.textMuted,
                                    size: 20.sp,
                                  ),
                                  onPressed: () => _isPasswordHidden.toggle(),
                                ),
                                validator: (value) => value!.length < 6 ? 'Minimum 6 characters' : null,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),

                        // Premium Action Button
                        Obx(() => BouncingElevatedWrapper(
                          child: ElevatedButton(
                            onPressed: controller.isLoading.value ? null : controller.register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: EdgeInsets.symmetric(vertical: 18.h),
                              elevation: 4,
                              shadowColor: AppColors.primary.withOpacity(0.3),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                            child: controller.isLoading.value
                                ? SizedBox(
                              height: 24.h,
                              width: 24.h,
                              child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                            )
                                : Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        )),
                        SizedBox(height: 24.h),

                        // Elegant Navigation Footer
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already a member? ", style: TextStyle(color: AppColors.textMuted, fontSize: 14.sp)),
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Text(
                                "Log In",
                                style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}