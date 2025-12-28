import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';

part 'device.g.dart';

@freezed
abstract class Device with _$Device {
  const factory Device({
    required String id,
    required String deviceId,
    required String deviceName,
    required String location,
    required DateTime createdAt,
    required String role,
    required DateTime linkedAt,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}
