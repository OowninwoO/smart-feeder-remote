import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_feeder_remote/api/mqtt_logs_api.dart';
import 'package:smart_feeder_remote/models/mqtt_log/item/mqtt_log.dart';
import 'package:smart_feeder_remote/models/mqtt_log/mqtt_log_page.dart';
import 'package:smart_feeder_remote/utils/log_utils.dart';

part 'mqtt_log_page_provider.g.dart';

final mqttLogPageProvider = mqttLogPageProviderProvider;

@Riverpod(keepAlive: true)
class MqttLogPageProvider extends _$MqttLogPageProvider {
  bool _isLoadingMore = false;

  @override
  MqttLogPage? build() => null;

  void set(MqttLogPage mqttLogPage) {
    state = mqttLogPage;
  }

  Future<void> fetchNext() async {
    if (_isLoadingMore) return;

    final current = state;
    if (current == null) return;
    if (current.hasMore != true) return;

    _isLoadingMore = true;

    try {
      final res = await MqttLogsApi.logs(
        cursorAt: current.cursorAt?.toIso8601String(),
        cursorId: current.cursorId,
      );

      final nextPage = MqttLogPage.fromJson(res['data']);

      state = current.copyWith(
        items: [...current.items, ...nextPage.items],
        cursorAt: nextPage.cursorAt,
        cursorId: nextPage.cursorId,
        hasMore: nextPage.hasMore,
      );
    } catch (e) {
      LogUtils.e('MqttLogPageProvider.fetchNext error=$e');
    } finally {
      _isLoadingMore = false;
    }
  }

  /// 새 로그를 맨 앞에 추가 (FCM 수신 시 사용)
  void prepend(MqttLog mqttLog) {
    final current = state;
    if (current == null) return;

    /// 중복 방지
    final exists = current.items.any((e) => e.id == mqttLog.id);
    if (exists) return;

    state = current.copyWith(items: [mqttLog, ...current.items]);
  }

  void clear() {
    state = null;
    _isLoadingMore = false;
  }
}
