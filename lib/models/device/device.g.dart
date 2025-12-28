// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Device _$DeviceFromJson(Map<String, dynamic> json) => _Device(
  id: (json['id'] as num).toInt(),
  deviceId: json['deviceId'] as String,
  deviceName: json['deviceName'] as String,
  location: json['location'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  role: json['role'] as String,
  linkedAt: DateTime.parse(json['linkedAt'] as String),
);

Map<String, dynamic> _$DeviceToJson(_Device instance) => <String, dynamic>{
  'id': instance.id,
  'deviceId': instance.deviceId,
  'deviceName': instance.deviceName,
  'location': instance.location,
  'createdAt': instance.createdAt.toIso8601String(),
  'role': instance.role,
  'linkedAt': instance.linkedAt.toIso8601String(),
};
