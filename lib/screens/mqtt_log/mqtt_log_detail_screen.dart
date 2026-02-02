import 'package:flutter/material.dart';
import 'package:smart_feeder_remote/models/mqtt_log/item/mqtt_log.dart';
import 'package:smart_feeder_remote/utils/datetime_utils.dart';
import 'package:smart_feeder_remote/widgets/cards/section_card.dart';

class MqttLogDetailScreen extends StatelessWidget {
  final MqttLog mqttLog;

  const MqttLogDetailScreen({super.key, required this.mqttLog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기록 상세')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionCard(
              icon: Icons.subject_outlined,
              title: '로그 기본 정보',
              items: [
                SectionItem(label: 'ID', value: '${mqttLog.id}'),
                SectionItem(
                  label: '시간',
                  value: DateTimeUtils.ymdHms(mqttLog.receivedAt),
                ),
                SectionItem(label: '디바이스', value: mqttLog.deviceId),
              ],
            ),
            const SizedBox(height: 16),
            SectionCard(
              icon: Icons.tune_outlined,
              title: '메시지',
              items: [
                SectionItem(label: '토픽', value: mqttLog.topic),
                SectionItem(label: '페이로드', value: mqttLog.payload ?? '-'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
