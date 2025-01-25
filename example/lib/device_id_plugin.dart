import 'package:flutter/services.dart';

class DeviceIdPlugin {
  static const MethodChannel _channel = MethodChannel('device_info_olimpo');

  /// Get the device ID from native code.
  static Future<String> getDeviceId() async {
    try {
      final String deviceId = await _channel.invokeMethod('getDeviceId');
      return deviceId;
    } catch (e) {
      throw 'Error al obtener el ID del dispositivo: $e';
    }
  }

  /// Get full device information from native code.
  static Future<Map<String, dynamic>> getFullDeviceInfo() async {
    try {
      final Map<String, dynamic> fullDeviceInfo =
          Map<String, dynamic>.from(await _channel.invokeMethod('getFullDeviceInfo'));
      return fullDeviceInfo;
    } catch (e) {
      throw 'Error al obtener la información completa del dispositivo: $e';
    }
  }
}
