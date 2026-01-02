import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  static Future<MqttServerClient> connect({
    required String host,
    required int port,
    required String username,
    required String password,
    required String uid,
  }) async {
    final client = MqttServerClient.withPort(host, uid, port);

    client.secure = true;
    client.keepAlivePeriod = 20;
    client.securityContext = SecurityContext.defaultContext;
    client.setProtocolV311();

    client.connectionMessage = MqttConnectMessage()
        .withClientIdentifier(uid)
        .startClean();

    await client.connect(username, password);

    return client;
  }
}
