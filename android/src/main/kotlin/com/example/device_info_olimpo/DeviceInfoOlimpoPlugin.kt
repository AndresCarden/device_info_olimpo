package com.example.device_info_olimpo

import android.app.ActivityManager
import android.content.Context
import android.os.BatteryManager
import android.os.Build
import android.provider.Settings
import android.security.KeyChain
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class DeviceInfoOlimpoPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var applicationContext: Context

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "device_info_olimpo")
        channel.setMethodCallHandler(this)
        applicationContext = binding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getDeviceId" -> {
                val deviceId = getDeviceId()
                result.success(deviceId)
            }
            "getFullDeviceInfo" -> {
                val deviceInfo = getFullDeviceInfo()
                result.success(deviceInfo)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    private fun getDeviceId(): String {
        return Settings.Secure.getString(
            applicationContext.contentResolver,
            Settings.Secure.ANDROID_ID
        )
    }

    private fun getFullDeviceInfo(): Map<String, String> {
        val batteryManager = applicationContext.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        val activityManager = applicationContext.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        val memoryInfo = ActivityManager.MemoryInfo()
        activityManager.getMemoryInfo(memoryInfo)

        return mapOf(
            "deviceId" to getDeviceId(),
            "deviceName" to Build.MODEL, // Nombre del dispositivo (por ejemplo, "Pixel 4a")
            "manufacturer" to Build.MANUFACTURER, // Fabricante (por ejemplo, "Google")
            "brand" to Build.BRAND, // Marca del dispositivo (por ejemplo, "Google")
            "hardware" to Build.HARDWARE, // Detalles del hardware (por ejemplo, "ranchu")
            "osVersion" to Build.VERSION.RELEASE, // Versión del sistema operativo (por ejemplo, "12")
            "sdkVersion" to Build.VERSION.SDK_INT.toString(), // Nivel del SDK (por ejemplo, "31")
            "buildId" to Build.ID, // ID de la build (por ejemplo, "SPB4.210715.014")
            "bootloader" to Build.BOOTLOADER, // Versión del bootloader
            "board" to Build.BOARD, // Placa base (por ejemplo, "goldfish_x86")
            "display" to Build.DISPLAY, // Descripción de la build
            "fingerprint" to Build.FINGERPRINT, // Huella digital única de la build
            "isEmulator" to (Build.FINGERPRINT.contains("generic")
                    || Build.MODEL.contains("google_sdk")
                    || Build.MODEL.lowercase().contains("emulator")
                    || Build.BRAND.startsWith("generic")
                    || Build.DEVICE.startsWith("generic")).toString(), // Si es emulador o no
            "product" to Build.PRODUCT, // Producto del dispositivo (por ejemplo, "sdk_gphone64_arm64")
            "cpuArchitecture" to Build.SUPPORTED_ABIS[0], // Arquitectura del CPU
            "totalMemory" to "${memoryInfo.totalMem / (1024 * 1024)} MB", // RAM total en MB
            "batteryLevel" to "${batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)}%", // Nivel de batería
            "isDeviceSecure" to (applicationContext.getSystemService(Context.KEYGUARD_SERVICE) as android.app.KeyguardManager)
                .isDeviceSecure.toString() // Indica si el dispositivo está protegido
        )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
