import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_iot/wifi_iot.dart';

class WifiConnector {
  static Future<bool> connectWifi() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    if (sdkInt >= 33) {
      final nearbyStatus = await Permission.nearbyWifiDevices.request();
      if (!nearbyStatus.isGranted) {
        print('Nearby Wi-Fi permission not granted.');
        return false;
      }
    } else {
      final locationStatus = await Permission.location.request();
      if (!locationStatus.isGranted) {
        print('Location permission not granted.');
        return false;
      }
    }

    final result = await WiFiForIoTPlugin.connect(
      dotenv.env['WIFI_SSID']!,
      password: dotenv.env['WIFI_PASSWORD']!,
      security: NetworkSecurity.WPA,
    );

    return result;
  }

  static Future<void> enableForce() async {
    await WiFiForIoTPlugin.forceWifiUsage(true);
  }

  static Future<void> disableForce() async {
    await WiFiForIoTPlugin.forceWifiUsage(false);
  }
}
