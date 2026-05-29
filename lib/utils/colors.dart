// import 'package:flutter/material.dart';
//
// class AppColors {
//   // Primary & Secondary (Eco-friendly & Tech Vibe)
//   static const Color primary = Color(0xFF059669); // Emerald Green
//   static const Color primaryDark = Color(0xFF047857); // Dark Green
//   static const Color accent = Color(0xFF0EA5E9); // Modern Tech Blue
//
//   // Backgrounds
//   static const Color background = Color(0xFFF8FAFC); // Light grayish-blue for modern UI
//   static const Color surface = Color(0xFFFFFFFF); // Pure white for Cards/Dialogs
//
//   // Text Colors
//   static const Color textPrimary = Color(0xFF0F172A); // Dark Slate for Headings
//   static const Color textSecondary = Color(0xFF64748B); // Cool Grey for subtitles/hints
//
//   // Status / Actions / Validation
//   static const Color error = Color(0xFFEF4444); // Red for form validation
//   static const Color success = Color(0xFF10B981); // Green for success messages
//   static const Color warning = Color(0xFFF59E0B); // Amber for alerts
//
//   // Borders & Dividers
//   static const Color border = Color(0xFFE2E8F0);
//
//   // Advance Level Gradients (For Login Buttons or Headers)
//   static const Gradient primaryGradient = LinearGradient(
//     colors: [Color(0xFF059669), Color(0xFF10B981)], // Emerald to Light Green
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   );
// }

import 'package:flutter/material.dart';

class AppColors {
  // Deep, premium eco-friendly green
  static const Color primary = Color(0xFF004D40);
  static const Color primaryLight = Color(0xFF39796B);

  // Backgrounds - extremely subtle grey for depth
  static const Color scaffoldBackground = Color(0xFFF4F7F6);
  static const Color cardSurface = Colors.white;

  // Text Colors
  static const Color textMain = Color(0xFF1A1A1A);
  static const Color textMuted = Color(0xFF757575);

  // Borders & Inputs
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color inputFocus = Color(0xFF004D40);

  // Action / Feedback
  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFD32F2F);

  static const Color accent = Color(0xFF0EA5E9); // Tech Blue color for highlight badges
}