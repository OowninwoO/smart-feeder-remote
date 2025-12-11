import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_iot/wifi_iot.dart';

class WifiConnector {
  static Future<void> connectWifi() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    if (sdkInt >= 33) {
      final nearbyStatus = await Permission.nearbyWifiDevices.request();
      if (!nearbyStatus.isGranted) {
        print('Nearby Wi-Fi permission not granted.');
        return;
      }
    } else {
      final locationStatus = await Permission.location.request();
      if (!locationStatus.isGranted) {
        print('Location permission not granted.');
        return;
      }
    }

    final wifiList = await WiFiForIoTPlugin.loadWifiList();
    if (wifiList.isEmpty) {
      print('No Wi-Fi networks found.');
      return;
    }

    print('Found ${wifiList.length} Wi-Fi networks:');
    for (final wifi in wifiList) {
      print('SSID: ${wifi.ssid}, BSSID: ${wifi.bssid}, level: ${wifi.level}');
    }
  }
}
