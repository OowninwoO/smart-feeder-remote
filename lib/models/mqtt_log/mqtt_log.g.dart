// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MqttLog _$MqttLogFromJson(Map<String, dynamic> json) => _MqttLog(
  id: json['id'] as String,
  receivedAt: DateTime.parse(json['receivedAt'] as String),
  deviceId: json['deviceId'] as String,
  topic: json['topic'] as String,
  payload: json['payload'] as String?,
);

Map<String, dynamic> _$MqttLogToJson(_MqttLog instance) => <String, dynamic>{
  'id': instance.id,
  'receivedAt': instance.receivedAt.toIso8601String(),
  'deviceId': instance.deviceId,
  'topic': instance.topic,
  'payload': instance.payload,
};
