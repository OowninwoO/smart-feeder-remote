import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_feeder_remote/api/mqtt_logs_api.dart';
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

  void clear() {
    state = null;
    _isLoadingMore = false;
  }

  Future<void> fetchNext() async {
    if (_isLoadingMore) return;
    if (state!.hasMore != true) return;

    _isLoadingMore = true;

    try {
      final res = await MqttLogsApi.logs(
        cursorAt: state!.cursorAt?.toIso8601String(),
        cursorId: state!.cursorId,
      );

      final data = res['data'];
      final nextPage = MqttLogPage.fromJson(data);

      state = state!.copyWith(
        items: [...state!.items, ...nextPage.items],
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
}
