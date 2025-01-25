import Flutter
import UIKit

public class DeviceInfoOlimpoPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "device_info_olimpo", binaryMessenger: registrar.messenger())
        let instance = DeviceInfoOlimpoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getDeviceId" {
            result(UIDevice.current.identifierForVendor?.uuidString ?? "Unknown")
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
