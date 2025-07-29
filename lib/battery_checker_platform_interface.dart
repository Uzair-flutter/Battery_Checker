// battery_checker_platform_interface.dart
import 'battery_checker_method_channel.dart';

abstract class BatteryCheckerPlatform {
  static final BatteryCheckerPlatform _instance = MethodChannelBatteryChecker();

  static BatteryCheckerPlatform get instance => _instance;

  Future<String> getBatteryLevel();

  // Add a new method signature for getPlatformVersion
  Future<String?> getPlatformVersion();
}
