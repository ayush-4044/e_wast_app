import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
  }) : super(key: key);

  // Breakpoints
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 650;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 650 && tablet != null) {
          return tablet!;
        }
        // Default mobile UI
        return mobile;
      },
    );
  }
}