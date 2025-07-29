// example/lib/main.dart
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:flutter/services.dart';
// import 'package:battery_checker/battery_checker.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _platformVersion = 'Unknown';
//   final _batteryCheckerPlugin = BatteryChecker();
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     // We also handle the message potentially returning null.
//     try {
//       platformVersion =
//           await _batteryCheckerPlugin.getPlatformVersion() ?? 'Unknown platform version';
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Text('Running on: $_platformVersion\n'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:battery_checker/battery_checker.dart'; // Import the plugin

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown'; // Store the platform version
  String _batteryLevel = 'Unknown'; // Store the battery level
  final _batteryCheckerPlugin =
      BatteryChecker(); // Create an instance of the plugin

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String batteryLevel;

    try {
      // Get platform version using the plugin's method
      platformVersion =
          await _batteryCheckerPlugin.getPlatformVersion() ??
          'Unknown platform version';
      print('Platform version: $platformVersion'); // Debug print
    } on PlatformException catch (e) {
      platformVersion =
          'Failed to get platform version: ${e.message}'; // Handle error
      print('Platform exception: ${e.message}'); // Debug print
    } catch (e) {
      platformVersion = 'Unexpected error: $e'; // Handle unexpected errors
      print('Unexpected error: $e'); // Debug print
    }

    try {
      // Get battery level using the plugin's method
      batteryLevel = await _batteryCheckerPlugin.getBatteryLevel();
      print('Battery level: $batteryLevel'); // Debug print
    } on PlatformException catch (e) {
      batteryLevel =
          'Failed to get battery level: ${e.message}'; // Handle error
      print('Battery exception: ${e.message}'); // Debug print
    } catch (e) {
      batteryLevel = 'Unexpected error: $e'; // Handle unexpected errors
      print('Battery unexpected error: $e'); // Debug print
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion =
          platformVersion; // Update the UI with the platform version
      _batteryLevel = batteryLevel; // Update the UI with the battery level
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin Example App'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Platform: $_platformVersion\n',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Battery: $_batteryLevel\n',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
