import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_feeder_remote/models/mqtt_log/mqtt_log.dart';

part 'mqtt_log_list_provider.g.dart';

final mqttLogListProvider = mqttLogListProviderProvider;

@Riverpod(keepAlive: true)
class MqttLogListProvider extends _$MqttLogListProvider {
  @override
  List<MqttLog> build() => [];

  void set(List<MqttLog> mqttLogs) {
    state = mqttLogs;
  }

  void clear() {
    state = [];
  }
}
