import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_feeder_remote/models/mqtt_log/mqtt_log_page.dart';

part 'mqtt_log_page_provider.g.dart';

final mqttLogPageProvider = mqttLogPageProviderProvider;

@Riverpod(keepAlive: true)
class MqttLogPageProvider extends _$MqttLogPageProvider {
  @override
  MqttLogPage? build() => null;

  void set(MqttLogPage page) {
    state = page;
  }

  void clear() {
    state = null;
  }
}
