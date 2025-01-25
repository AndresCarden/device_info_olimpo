import 'package:flutter/material.dart';
import 'device_id_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get the device ID
  final deviceId = await DeviceIdPlugin.getDeviceId();

 // Get full device information
  final fullDeviceInfo = await DeviceIdPlugin.getFullDeviceInfo();

  runApp(MyApp(deviceId: deviceId, fullDeviceInfo: fullDeviceInfo));
}

class MyApp extends StatelessWidget {
  final String deviceId;
  final Map<String, dynamic> fullDeviceInfo;

  const MyApp({Key? key, required this.deviceId, required this.fullDeviceInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Device Info Plugin Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Device ID: $deviceId', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text('Full Device Info:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: fullDeviceInfo.entries.map((entry) {
                    return Text('${entry.key}: ${entry.value}', style: const TextStyle(fontSize: 14));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
