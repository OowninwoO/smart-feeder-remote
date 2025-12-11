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

    const ssid = 'ETAP_CF:75:84';
    const password = '12341234';

    await WiFiForIoTPlugin.connect(
      ssid,
      password: password,
      security: NetworkSecurity.WPA,
    );

    print('Connect requested to $ssid');
  }
}
