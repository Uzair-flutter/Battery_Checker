// import 'package:flutter_test/flutter_test.dart';
// import 'package:battery_checker/battery_checker.dart';
// import 'package:battery_checker/battery_checker_platform_interface.dart';
// import 'package:battery_checker/battery_checker_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockBatteryCheckerPlatform
//     with MockPlatformInterfaceMixin
//     implements BatteryCheckerPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final BatteryCheckerPlatform initialPlatform = BatteryCheckerPlatform.instance;
//
//   test('$MethodChannelBatteryChecker is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelBatteryChecker>());
//   });
//
//   test('getPlatformVersion', () async {
//     BatteryChecker batteryCheckerPlugin = BatteryChecker();
//     MockBatteryCheckerPlatform fakePlatform = MockBatteryCheckerPlatform();
//     BatteryCheckerPlatform.instance = fakePlatform;
//
//     expect(await batteryCheckerPlugin.getPlatformVersion(), '42');
//   });
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:battery_checker/battery_checker.dart'; // Replace with correct plugin import

void main() {
  final BatteryChecker batteryChecker = BatteryChecker();

  test('getBatteryLevel should return battery level as a string', () async {
    // Normally you'd get data from the native platform, but we're assuming
    // here that it returns a correctly formatted string for battery level.
    final result = await batteryChecker.getBatteryLevel();

    expect(result, isA<String>());  // Ensure it returns a string
    expect(result, 'Battery level is 85%');  // Expected battery level string
  });
}
