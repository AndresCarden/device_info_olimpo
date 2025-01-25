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
}
