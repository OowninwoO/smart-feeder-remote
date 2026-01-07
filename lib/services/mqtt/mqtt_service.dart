import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import '../../utils/log_utils.dart';

class MqttService {
  static MqttServerClient? _client;

  static MqttServerClient? get client => _client;

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
    _client!.disconnect();
    _client = null;
  }

  static void listen() {
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
    _client!.subscribe(topic, MqttQos.atLeastOnce);
  }

  static void unsubscribe({required String topic}) {
    _client!.unsubscribe(topic);
  }

  static void publish({required String topic, required String message}) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    _client!.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }
}
