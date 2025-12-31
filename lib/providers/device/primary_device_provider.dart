import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_feeder_remote/models/device/device.dart';
import 'package:smart_feeder_remote/providers/device/device_list_provider.dart';

part 'primary_device_provider.g.dart';

final primaryDeviceProvider = primaryDeviceProviderProvider;

@Riverpod(keepAlive: true)
class PrimaryDeviceProvider extends _$PrimaryDeviceProvider {
  String? _selectedDeviceId;

  @override
  Device? build() {
    final deviceList = ref.watch(deviceListProvider);

    if (deviceList.isEmpty) {
      _selectedDeviceId = null;
      return null;
    }

    if (_selectedDeviceId == null) return deviceList.first;

    return deviceList.firstWhere(
      (d) => d.deviceId == _selectedDeviceId,
      orElse: () {
        _selectedDeviceId = null;
        return deviceList.first;
      },
    );
  }

  void set(Device device) {
    _selectedDeviceId = device.deviceId;
    state = device;
  }

  void clear() {
    _selectedDeviceId = null;

    final deviceList = ref.read(deviceListProvider);
    if (deviceList.isEmpty) {
      state = null;
    } else {
      state = deviceList.first;
    }
  }
}
