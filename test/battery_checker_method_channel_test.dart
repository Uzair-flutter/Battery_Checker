// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:battery_checker/battery_checker_method_channel.dart';
//
// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();
//
//   MethodChannelBatteryChecker platform = MethodChannelBatteryChecker();
//   const MethodChannel channel = MethodChannel('battery_checker');
//
//   setUp(() {
//     TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
//       channel,
//       (MethodCall methodCall) async {
//         return '42';
//       },
//     );
//   });
//
//   tearDown(() {
//     TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
//   });
//
//   test('getPlatformVersion', () async {
//     expect(await platform.getPlatformVersion(), '42');
//   });
// }

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:battery_checker/battery_checker.dart'; // Replace with correct plugin import

void main() {
  const MethodChannel channel = MethodChannel('samples.flutter.dev/battery');

  TestWidgetsFlutterBinding.ensureInitialized();

  group('BatteryChecker MethodChannel', () {
    final BatteryChecker batteryChecker = BatteryChecker();

    setUp(() {
      // Set up your channel and simulate the interaction with the native code
      channel.setMethodCallHandler((MethodCall call) async {
        if (call.method == 'getBatteryLevel') {
          return 85; // Simulating a battery level of 85%
        }
        return null;
      });
    });

    test('getBatteryLevel returns battery level as a string', () async {
      final batteryLevel = await batteryChecker.getBatteryLevel();

      expect(batteryLevel, isA<String>());
      expect(batteryLevel, 'Battery level is 85%');
    });

    test('getBatteryLevel handles error', () async {
      // Simulate an error if necessary
      channel.setMethodCallHandler((MethodCall call) async {
        if (call.method == 'getBatteryLevel') {
          throw PlatformException(code: 'UNAVAILABLE', message: 'Battery level not available');
        }
        return null;
      });

      final batteryLevel = await batteryChecker.getBatteryLevel();

      expect(batteryLevel, 'Failed to get battery level: \'Battery level not available\'');
    });
  });
}
