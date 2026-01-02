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
    final client = MqttServerClient(host, uid);

    client.port = port;
    client.secure = true;
    client.keepAlivePeriod = 20;

    client.securityContext = SecurityContext.defaultContext;

    client.connectionMessage = MqttConnectMessage()
        .withClientIdentifier(uid)
        .authenticateAs(username, password)
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    await client.connect();

    return client;
  }
}
