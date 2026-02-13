import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_feeder_remote/models/mqtt_log/item/mqtt_log.dart';

class MqttLogBgStore {
  MqttLogBgStore._();

  static const _key = 'bg_mqtt_logs';

  static Future<void> append(MqttLog mqttLog) async {
    final prefs = await SharedPreferences.getInstance();

    final raw = prefs.getString(_key);
    final list = raw == null ? [] : jsonDecode(raw);

    list.add(mqttLog.toJson());

    await prefs.setString(_key, jsonEncode(list));
  }

  static Future<List<MqttLog>> takeAll() async {
    final prefs = await SharedPreferences.getInstance();

    final raw = prefs.getString(_key);
    if (raw == null) return [];

    await prefs.remove(_key);

    final list = jsonDecode(raw);

    return [for (final item in list) MqttLog.fromJson(item)];
  }
}
