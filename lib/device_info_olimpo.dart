
import 'device_info_olimpo_platform_interface.dart';

class DeviceInfoOlimpo {
  Future<String?> getPlatformVersion() {
    return DeviceInfoOlimpoPlatform.instance.getPlatformVersion();
  }
}
