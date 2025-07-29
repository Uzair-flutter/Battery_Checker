// battery_checker_method_channel.dart
import 'package:flutter/services.dart';

import 'battery_checker_platform_interface.dart';

class MethodChannelBatteryChecker extends BatteryCheckerPlatform {
  static const MethodChannel _channel = MethodChannel('battery_checker');

  @override
  Future<String> getBatteryLevel() async {
    try {
      final int? batteryLevel = await _channel.invokeMethod<int>(
        'getBatteryLevel',
      );
      return 'Battery level is $batteryLevel%';
    } on PlatformException catch (e) {
      return "Failed to get battery level: '${e.message}'";
    }
  }

  @override
  Future<String?> getPlatformVersion() async {
    try {
      final String? version = await _channel.invokeMethod<String>(
        'getPlatformVersion',
      );
      return version;
    } on PlatformException catch (e) {
      return "Failed to get platform version: '${e.message}'";
    }
  }
}
