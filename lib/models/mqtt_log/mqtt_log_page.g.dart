// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_log_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MqttLogPage _$MqttLogPageFromJson(Map<String, dynamic> json) => _MqttLogPage(
  cursorAt: json['cursorAt'] == null
      ? null
      : DateTime.parse(json['cursorAt'] as String),
  cursorId: (json['cursorId'] as num?)?.toInt(),
  hasMore: json['hasMore'] as bool,
  items: (json['items'] as List<dynamic>)
      .map((e) => MqttLog.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MqttLogPageToJson(_MqttLogPage instance) =>
    <String, dynamic>{
      'cursorAt': instance.cursorAt?.toIso8601String(),
      'cursorId': instance.cursorId,
      'hasMore': instance.hasMore,
      'items': instance.items,
    };
