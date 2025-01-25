# device_info_olimpo

[![pub package](https://img.shields.io/pub/v/device_info_olimpo.svg)](https://pub.dev/packages/device_info_olimpo)

`device_info_olimpo` es un plugin de Flutter que permite obtener información detallada y el ID único del dispositivo de manera nativa en Android e iOS. Este plugin es útil para identificar dispositivos de manera única y obtener datos relevantes del hardware y software.

## Características

- Obtiene el **Android ID** en dispositivos Android.
- Obtiene el **identifierForVendor** en dispositivos iOS.
- Proporciona información detallada sobre el dispositivo, incluyendo:
  - Identificador único del dispositivo.
  - Nombre del dispositivo.
  - Fabricante, marca y modelo.
  - Versión del sistema operativo y nivel del SDK.
  - Detalles del hardware, build y más.

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

  // Obtener solo el ID del dispositivo
  final deviceId = await deviceInfo.getDeviceId();
  print('El ID del dispositivo es: $deviceId');

  // Obtener información completa del dispositivo
  final fullDeviceInfo = await deviceInfo.getFullDeviceInfo();
  print('Información completa del dispositivo:');
  fullDeviceInfo.forEach((key, value) {
    print('$key: $value');
  });
}
```

## Información Proporcionada

El plugin devuelve la siguiente información específica:

### **Android**
| Campo            | Descripción                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| **deviceId**      | Identificador único del dispositivo (Android ID).                          |
| **deviceName**    | Nombre del dispositivo (ejemplo: `Pixel 4a`).                              |
| **manufacturer**  | Fabricante del dispositivo (ejemplo: `Google`).                            |
| **brand**         | Marca del dispositivo (ejemplo: `Google`).                                 |
| **hardware**      | Detalles del hardware (ejemplo: `ranchu`).                                 |
| **osVersion**     | Versión del sistema operativo (ejemplo: `12`).                             |
| **sdkVersion**    | Nivel del SDK (ejemplo: `31`).                                             |
| **buildId**       | ID de la build (ejemplo: `SPB4.210715.014`).                               |
| **bootloader**    | Versión del bootloader.                                                    |
| **board**         | Placa base (ejemplo: `goldfish_x86`).                                      |
| **display**       | Descripción de la build.                                                   |
| **fingerprint**   | Huella digital única de la build.                                          |
| **isEmulator**    | Si el dispositivo es un emulador o no (`true` o `false`).                  |
| **product**       | Producto del dispositivo (ejemplo: `sdk_gphone64_arm64`).                  |

### **iOS**
| Campo                | Descripción                                                                  |
|-----------------------|------------------------------------------------------------------------------|
| **deviceId**          | Identificador único del dispositivo (`identifierForVendor`).                |
| **deviceName**        | Nombre del dispositivo (ejemplo: `iPhone de Juan`).                        |
| **systemName**        | Nombre del sistema operativo (ejemplo: `iOS`).                             |
| **systemVersion**     | Versión del sistema operativo (ejemplo: `16.3`).                           |
| **model**             | Modelo del dispositivo (ejemplo: `iPhone`).                                |
| **localizedModel**    | Modelo localizado del dispositivo.                                          |
| **identifierForVendor** | UUID del dispositivo.                                                    |
| **isSimulator**       | Si el dispositivo es un simulador o no (`true` o `false`).                 |

## Ejemplo Completo

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
          child: FutureBuilder<Map<String, dynamic>>(
            future: DeviceInfoOlimpo().getFullDeviceInfo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final data = snapshot.data ?? {};
                return ListView(
                  children: data.entries.map((entry) => Text('${entry.key}: ${entry.value}')).toList(),
                );
              }
            },
          ),
        ),
      ),
    );
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
