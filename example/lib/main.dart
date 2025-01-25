import 'package:flutter/material.dart';
import 'test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final deviceId = await DeviceIdPlugin.getDeviceId();
  runApp(MyApp(deviceId: deviceId));
}

class MyApp extends StatelessWidget {
  final String deviceId;

  const MyApp({Key? key, required this.deviceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Device ID Plugin Example')),
        body: Center(child: Text('Device ID: $deviceId')),
      ),
    );
  }
}
