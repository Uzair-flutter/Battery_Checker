import Flutter
import UIKit

public class BatteryCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "battery_checker", binaryMessenger: registrar.messenger())
    let instance = BatteryCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getBatteryLevel":
      UIDevice.current.isBatteryMonitoringEnabled = true
      let batteryLevel = Int(UIDevice.current.batteryLevel * 100)
      result(batteryLevel)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
