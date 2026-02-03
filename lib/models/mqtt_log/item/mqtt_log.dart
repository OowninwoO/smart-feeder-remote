import 'package:freezed_annotation/freezed_annotation.dart';

part 'mqtt_log.freezed.dart';

part 'mqtt_log.g.dart';

@freezed
abstract class MqttLog with _$MqttLog {
  const factory MqttLog({
    required int id,
    required DateTime receivedAt,
    required String deviceId,
    required String topic,
    required String? payload,
  }) = _MqttLog;

  factory MqttLog.fromJson(Map<String, dynamic> json) =>
      _$MqttLogFromJson(json);

  factory MqttLog.fromFcm(Map<String, dynamic> data) {
    return MqttLog(
      id: int.parse(data['id']),
      receivedAt: DateTime.parse(data['receivedAt']),
      deviceId: data['deviceId'],
      topic: data['topic'],
      payload: data['payload'].isEmpty ? null : data['payload'],
    );
  }
}
