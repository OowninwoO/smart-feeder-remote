import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import '../../utils/log_utils.dart';

class MqttService {
  static MqttServerClient? _client;

  static MqttServerClient? get client => _client;

  static MqttConnectionState? get connectionState =>
      _client?.connectionStatus?.state;

  static bool get isConnected =>
      connectionState == MqttConnectionState.connected;

  static Future<void> connect({
    required String host,
    required int port,
    required String username,
    required String password,
    required String uid,
  }) async {
    _client = MqttServerClient.withPort(host, uid, port);

    _client!.secure = true;
    _client!.keepAlivePeriod = 20;
    _client!.securityContext = SecurityContext.defaultContext;
    _client!.setProtocolV311();

    _client!.autoReconnect = true;
    _client!.resubscribeOnAutoReconnect = true;

    _client!.connectionMessage = MqttConnectMessage()
        .withClientIdentifier(uid)
        .startClean();

    await _client!.connect(username, password);
  }

  static void disconnect() {
    if (_client == null) return;

    _client!.disconnect();
    _client = null;
  }

  static void listen() {
    if (_client == null) return;

    _client!.updates!.listen((events) {
      for (final e in events) {
        final topic = e.topic;
        final msg = e.payload;

        if (msg is MqttPublishMessage) {
          final message = MqttPublishPayload.bytesToStringAsString(
            msg.payload.message,
          );
          LogUtils.d('mqtt received:$topic/$message');
        }
      }
    });
  }

  static void subscribe({required String topic}) {
    if (_client == null) return;
    if (!isConnected) return;

    _client!.subscribe(topic, MqttQos.atLeastOnce);
  }

  static void unsubscribe({required String topic}) {
    if (_client == null) return;
    if (!isConnected) return;

    _client!.unsubscribe(topic);
  }

  static void publish({required String topic, required String message}) {
    if (_client == null) return;
    if (!isConnected) return;

    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    _client!.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }
}
