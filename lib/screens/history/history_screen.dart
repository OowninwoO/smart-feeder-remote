import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_feeder_remote/providers/mqtt_log/mqtt_log_page_provider.dart';
import 'package:smart_feeder_remote/theme/app_colors.dart';
import 'package:smart_feeder_remote/utils/datetime_utils.dart';
import 'package:smart_feeder_remote/widgets/cards/app_card.dart';
import 'package:smart_feeder_remote/widgets/list_tiles/app_list_tile.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mqttLogPage = ref.watch(mqttLogPageProvider);
    final mqttLogList = mqttLogPage?.items ?? [];

    return mqttLogList.isEmpty
        ? const Center(child: Text('기록이 없습니다.'))
        : ListView.separated(
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: mqttLogList.length,
            itemBuilder: (context, index) {
              final mqttLog = mqttLogList[index];

              return AppCard(
                color: AppColors.cardPrimary,
                child: AppListTile(
                  title: mqttLog.topic,
                  subtitle:
                      '${mqttLog.deviceId} • ${DateTimeUtils.ymdHms(mqttLog.receivedAt)}',
                ),
              );
            },
          );
  }
}
