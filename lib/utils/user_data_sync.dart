import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_feeder_remote/providers/device/device_list_provider.dart';

import '../api/devices_api.dart';
import '../models/device/device.dart';

Future<void> loadDevices(WidgetRef ref) async {
  final res = await DevicesApi.myDevices();
  final data = res['data'];
  final devices = data.map<Device>((e) => Device.fromJson(e)).toList();
  ref.read(deviceListProvider.notifier).set(devices);
}
