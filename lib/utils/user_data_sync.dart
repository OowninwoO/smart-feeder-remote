import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_feeder_remote/providers/device/device_list_provider.dart';
import 'package:smart_feeder_remote/providers/device/primary_device_provider.dart';

import '../api/devices_api.dart';
import '../models/device/device.dart';
import '../services/auth/auth_service.dart';
import '../services/mqtt/mqtt_service.dart';

Future<void> loadDevices(WidgetRef ref) async {
  final res = await DevicesApi.myDevices();
  final data = res['data'];
  final devices = data.map<Device>((e) => Device.fromJson(e)).toList();
  ref.read(deviceListProvider.notifier).set(devices);
}

Future<void> initMqttSub(WidgetRef ref) async {
  await MqttService.connect(
    host: dotenv.env['MQTT_HOST']!,
    port: int.parse(dotenv.env['MQTT_PORT']!),
    username: dotenv.env['MQTT_USERNAME']!,
    password: dotenv.env['MQTT_PASSWORD']!,
    uid: AuthService.currentUser!.uid,
  );

  /// MQTT 수신 리스너 등록
  MqttService.listen();

  /// 대표 기기 변경 감지
  ref.listenManual(primaryDeviceProvider, (prev, next) {
    final prevDeviceId = prev?.deviceId;
    final nextDeviceId = next?.deviceId;

    if (prevDeviceId == nextDeviceId) return;

    /// 대표 기기 변경 및 상태 초기화
    MqttService.primaryDeviceId = nextDeviceId;
    MqttService.primaryDevicePresence.value = null;
    MqttService.primaryDeviceActivityState.value = null;

    if (prevDeviceId != null) {
      MqttService.unsubscribe(topic: 'feeder/$prevDeviceId/#');
    }

    if (nextDeviceId != null) {
      MqttService.subscribe(topic: 'feeder/$nextDeviceId/#');
    }
  });

  final primaryDeviceId = ref.read(primaryDeviceProvider)?.deviceId;
  if (primaryDeviceId == null) return;

  MqttService.primaryDeviceId = primaryDeviceId;

  MqttService.subscribe(topic: 'feeder/$primaryDeviceId/#');
}
