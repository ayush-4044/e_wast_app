import 'package:e_wast_app/ui/auth_screens/registration_screen.dart';
import 'package:e_wast_app/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controller/auth_controller/login_controller.dart';
import '../../utils/colors.dart';
import '../../utils/custom_text_filed.dart';
import '../../utils/responsive_code/responsive_extensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());
  final RxBool _isPasswordHidden = true.obs;

  // 1. Text Controllers ahiya initialize karya
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 2. UI bandh thay tyare controllers ahiya thi properly dispose thase
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        children: [
          // Background Decorative Shape 1
          Positioned(
            top: -80.h,
            left: -80.w,
            child: Container(
              height: 250.h,
              width: 250.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryLight.withOpacity(0.06),
              ),
            ),
          ),

          // Background Decorative Shape 2
          Positioned(
            bottom: -100.h,
            right: -50.w,
            child: Container(
              height: 300.h,
              width: 300.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.08),
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
                            padding: EdgeInsets.all(18.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.12),
                                  blurRadius: 25,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Icon(Icons.lock_person_rounded, size: 55.h, color: AppColors.primary),
                          ),
                        ),
                        SizedBox(height: 24.h),

                        Text(
                          "Welcome Back",
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
                          "Sign in to continue your green journey",
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
                              // Email Field
                              CustomTextField(
                                controller: emailController, // Direct local controller use karyo
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
                                controller: passwordController, // Direct local controller use karyo
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
                                validator: (value) => value!.isEmpty ? 'Password required' : null,
                              )),

                              // Forgot Password Link
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    // Handle forgot password logic
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
                                    minimumSize: Size.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: AppColors.primaryLight,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),

                        // Premium Login Button
                        Obx(() => BouncingElevatedWrapper(
                          child: ElevatedButton(
                            // 3. Ahiya values direct pass kari
                            onPressed: controller.isLoading.value
                                ? null
                                : () => controller.login(emailController.text, passwordController.text),
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
                              "Sign In",
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        )),
                        SizedBox(height: 24.h),

                        // Elegant Navigation Footer
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? ", style: TextStyle(color: AppColors.textMuted, fontSize: 14.sp)),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => RegistrationScreen()); // Use callback syntax
                              },
                              child: Text(
                                "Register Now",
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