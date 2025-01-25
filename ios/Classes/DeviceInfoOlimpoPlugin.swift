import Flutter
import UIKit

public class DeviceInfoOlimpoPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "device_info_olimpo", binaryMessenger: registrar.messenger())
        let instance = DeviceInfoOlimpoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getDeviceId":
            result(getDeviceId())
        case "getFullDeviceInfo":
            result(getFullDeviceInfo())
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func getDeviceId() -> String {
        return UIDevice.current.identifierForVendor?.uuidString ?? "Unknown"
    }

    private func getFullDeviceInfo() -> [String: String] {
        let device = UIDevice.current
        let processInfo = ProcessInfo.processInfo
        let memoryFormatter = ByteCountFormatter()
        memoryFormatter.allowedUnits = .useMB
        memoryFormatter.countStyle = .memory

        return [
            "deviceId": getDeviceId(), // Identificador único del dispositivo
            "deviceName": device.name, // Nombre del dispositivo (ej. "iPhone de Juan")
            "systemName": device.systemName, // Nombre del sistema operativo (ej. "iOS")
            "systemVersion": device.systemVersion, // Versión del sistema operativo (ej. "16.3")
            "model": device.model, // Modelo del dispositivo (ej. "iPhone")
            "localizedModel": device.localizedModel, // Modelo localizado
            "identifierForVendor": getDeviceId(), // UUID del dispositivo
            "isSimulator": "\(isSimulator())", // Detectar si es un simulador
            "batteryLevel": "\(Int(device.batteryLevel * 100))%", // Nivel de batería en porcentaje
            "cpuCount": "\(processInfo.processorCount)", // Número de núcleos del CPU
            "physicalMemory": memoryFormatter.string(fromByteCount: Int64(processInfo.physicalMemory)), // Memoria física total
            "activeProcessorCount": "\(processInfo.activeProcessorCount)", // Núcleos activos del CPU
        ]
    }

    private func isSimulator() -> Bool {
        return TARGET_OS_SIMULATOR != 0
    }
}
