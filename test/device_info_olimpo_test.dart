import 'package:flutter_test/flutter_test.dart';
import 'package:device_info_olimpo/device_info_olimpo.dart';
import 'package:device_info_olimpo/device_info_olimpo_platform_interface.dart';
import 'package:device_info_olimpo/device_info_olimpo_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceInfoOlimpoPlatform
    with MockPlatformInterfaceMixin
    implements DeviceInfoOlimpoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DeviceInfoOlimpoPlatform initialPlatform = DeviceInfoOlimpoPlatform.instance;

  test('$MethodChannelDeviceInfoOlimpo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceInfoOlimpo>());
  });

  test('getPlatformVersion', () async {
    DeviceInfoOlimpo deviceInfoOlimpoPlugin = DeviceInfoOlimpo();
    MockDeviceInfoOlimpoPlatform fakePlatform = MockDeviceInfoOlimpoPlatform();
    DeviceInfoOlimpoPlatform.instance = fakePlatform;

    expect(await deviceInfoOlimpoPlugin.getPlatformVersion(), '42');
  });
}
