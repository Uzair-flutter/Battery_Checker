// battery_checker.dart
import 'battery_checker_platform_interface.dart';

class BatteryChecker {
  // Method to get the battery level from platform code (Kotlin/Android)
  Future<String> getBatteryLevel() {
    return BatteryCheckerPlatform.instance.getBatteryLevel();
  }

  // New method to get the platform version (to match the example test)
  Future<String?> getPlatformVersion() {
    return BatteryCheckerPlatform.instance.getPlatformVersion();
  }
}
