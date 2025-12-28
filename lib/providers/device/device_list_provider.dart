import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/device/device.dart';

part 'device_list_provider.g.dart';

final deviceListProvider = deviceListProviderProvider;

@Riverpod(keepAlive: true)
class DeviceListProvider extends _$DeviceListProvider {
  @override
  List<Device> build() => [];

  void set(List<Device> devices) {
    state = devices;
  }

  void upsert(Device device) {
    final next = [...state];
    final index = next.indexWhere((e) => e.deviceId == device.deviceId);

    if (index == -1) {
      next.add(device);
    } else {
      next[index] = device;
    }

    state = next;
  }

  void remove(String deviceId) {
    state = state.where((e) => e.deviceId != deviceId).toList();
  }

  void clear() {
    state = [];
  }
}
