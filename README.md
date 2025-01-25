# device_info_olimpo

[![pub package](https://img.shields.io/pub/v/device_info_olimpo.svg)](https://pub.dev/packages/device_info_olimpo)

`device_info_olimpo` es un plugin de Flutter que permite obtener el ID único del dispositivo de manera nativa en Android e iOS. Este plugin es útil para identificar dispositivos de manera única en aplicaciones móviles.

## Características

- Obtiene el **Android ID** en dispositivos Android.
- Obtiene el **identifierForVendor** en dispositivos iOS.

## Instalación

Agrega la dependencia en tu archivo `pubspec.yaml`:

```yaml
dependencies:
  device_info_olimpo: ^0.0.1
```

Ejecuta el siguiente comando para instalar la dependencia:

```bash
flutter pub get
```

## Uso

Importa el paquete en tu archivo Dart:

```dart
import 'package:device_info_olimpo/device_info_olimpo.dart';

void main() async {
  final deviceInfo = DeviceInfoOlimpo();
  final deviceId = await deviceInfo.getDeviceId();

  print('El ID del dispositivo es: \$deviceId');
}
```

## Ejemplo Completo

Aquí tienes un ejemplo completo:

```dart
import 'package:flutter/material.dart';
import 'package:device_info_olimpo/device_info_olimpo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Device Info Olimpo'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: getDeviceId(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: \${snapshot.error}');
              } else {
                return Text('Device ID: \${snapshot.data}');
              }
            },
          ),
        ),
      ),
    );
  }

  Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoOlimpo();
    return await deviceInfo.getDeviceId();
  }
}
```

## Compatibilidad

| Plataforma | Soportado |
|------------|-----------|
| Android    | ✅         |
| iOS        | ✅         |

## Contribuciones

¡Las contribuciones son bienvenidas! Si deseas mejorar este paquete, crea un `pull request` en el [repositorio de GitHub](https://github.com/AndresCarden/device_info_olimpo).

## Licencia

Este proyecto está bajo la licencia [MIT](https://opensource.org/licenses/MIT). Consulta el archivo [LICENSE](https://github.com/AndresCarden/device_info_olimpo/blob/main/LICENSE) para más detalles.

