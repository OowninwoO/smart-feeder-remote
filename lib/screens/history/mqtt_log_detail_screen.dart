import 'package:flutter/material.dart';
import 'package:smart_feeder_remote/models/mqtt_log/item/mqtt_log.dart';
import 'package:smart_feeder_remote/theme/app_colors.dart';
import 'package:smart_feeder_remote/utils/datetime_utils.dart';
import 'package:smart_feeder_remote/widgets/cards/app_card.dart';
import 'package:smart_feeder_remote/widgets/list_tiles/app_list_tile.dart';

class MqttLogDetailScreen extends StatelessWidget {
  final MqttLog mqttLog;

  const MqttLogDetailScreen({super.key, required this.mqttLog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기록 상세')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AppCard(
          color: AppColors.cardPrimary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppListTile(title: 'ID', subtitle: '${mqttLog.id}'),
              AppListTile(
                title: '시간',
                subtitle: DateTimeUtils.ymdHms(mqttLog.receivedAt),
              ),
              AppListTile(title: '디바이스', subtitle: mqttLog.deviceId),
              AppListTile(title: '토픽', subtitle: mqttLog.topic),
              AppListTile(title: '페이로드', subtitle: mqttLog.payload ?? '-'),
            ],
          ),
        ),
      ),
    );
  }
}
