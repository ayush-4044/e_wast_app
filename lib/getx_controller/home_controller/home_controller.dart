import 'package:e_wast_app/ui/map_loactor/map_locator_screen.dart';
import 'package:e_wast_app/ui/my_reward/my_reward_screen.dart';
import 'package:e_wast_app/ui/profile_screen/profile_screen.dart';
import 'package:e_wast_app/ui/schedule_screen/schedule_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var userName = "Ayush".obs;
  var recycledWeight = 5.2.obs; // In KGs
  var greenPoints = 350.obs;

  // Actions
  void schedulePickup() {
    Get.to(ScheduleScreen());
  }

  void openMapLocator() {
    Get.to(MapLocatorScreen());
  }
  void myReward() {
    Get.to(RewardsScreen());
  }
  void profile() {
    Get.to(ProfileScreen());
  }
}