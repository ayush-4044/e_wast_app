import 'package:get/get.dart';

extension ResponsiveSize on num {
  static const double _mockupWidth = 375.0;
  static const double _mockupHeight = 812.0;

  double get w => (this / _mockupWidth) * Get.width;

  double get h => (this / _mockupHeight) * Get.height;

  double get sp {
    if (Get.width > 600) {
      return this * 1.3;
    }
    return this.toDouble();
  }
}