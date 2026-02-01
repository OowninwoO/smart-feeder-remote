import 'package:flutter/material.dart';
import 'package:smart_feeder_remote/models/mqtt_log/item/mqtt_log.dart';
import 'package:smart_feeder_remote/theme/app_colors.dart';
import 'package:smart_feeder_remote/utils/datetime_utils.dart';
import 'package:smart_feeder_remote/widgets/cards/app_card.dart';

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
            _SectionCard(
              icon: Icons.subject_outlined,
              title: '로그 기본 정보',
              items: [
                _SectionItem(label: 'ID', value: '${mqttLog.id}'),
                _SectionItem(
                  label: '시간',
                  value: DateTimeUtils.ymdHms(mqttLog.receivedAt),
                ),
                _SectionItem(label: '디바이스', value: mqttLog.deviceId),
              ],
            ),
            const SizedBox(height: 16),
            _SectionCard(
              icon: Icons.tune_outlined,
              title: '메시지',
              items: [
                _SectionItem(label: '토픽', value: mqttLog.topic),
                _SectionItem(label: '페이로드', value: mqttLog.payload ?? '-'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<_SectionItem> items;

  const _SectionCard({
    required this.icon,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.cardPrimary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.textOnLight),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.textOnLight,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...items.map((e) {
              final isLast = e == items.last;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  e,
                  if (!isLast) const Divider(color: AppColors.divider),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _SectionItem extends StatelessWidget {
  final String label;
  final String value;

  const _SectionItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textOnLight)),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: AppColors.textOnLight,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
