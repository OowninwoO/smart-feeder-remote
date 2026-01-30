import 'package:freezed_annotation/freezed_annotation.dart';
import 'item/mqtt_log.dart';

part 'mqtt_log_page.freezed.dart';

part 'mqtt_log_page.g.dart';

@freezed
abstract class MqttLogPage with _$MqttLogPage {
  const factory MqttLogPage({
    required DateTime? cursorAt,
    required String? cursorId,
    required bool hasMore,
    required List<MqttLog> items,
  }) = _MqttLogPage;

  factory MqttLogPage.fromJson(Map<String, dynamic> json) =>
      _$MqttLogPageFromJson(json);
}
