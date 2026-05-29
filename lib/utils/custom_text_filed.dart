import 'package:e_wast_app/utils/responsive_code/responsive_extensions.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLength,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validator,
        maxLength: maxLength,
        style: TextStyle(color: AppColors.textMain, fontWeight: FontWeight.w500, fontSize: 15.sp),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 14.sp),
          prefixIcon: Icon(icon, color: AppColors.primaryLight, size: 22.sp),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: AppColors.cardSurface,
          counterText: "",
          contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16), // Premium soft corners
            borderSide: const BorderSide(color: AppColors.inputBorder, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.inputFocus, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.error, width: 2),
          ),
        ),
      ),
    );
  }
}