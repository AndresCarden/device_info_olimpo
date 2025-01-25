import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_info_olimpo_method_channel.dart';

abstract class DeviceInfoOlimpoPlatform extends PlatformInterface {
  /// Constructs a DeviceInfoOlimpoPlatform.
  DeviceInfoOlimpoPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceInfoOlimpoPlatform _instance = MethodChannelDeviceInfoOlimpo();

  /// The default instance of [DeviceInfoOlimpoPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceInfoOlimpo].
  static DeviceInfoOlimpoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceInfoOlimpoPlatform] when
  /// they register themselves.
  static set instance(DeviceInfoOlimpoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
