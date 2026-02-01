import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_feeder_remote/providers/mqtt_log/mqtt_log_page_provider.dart';
import 'package:smart_feeder_remote/theme/app_colors.dart';
import 'package:smart_feeder_remote/utils/datetime_utils.dart';
import 'package:smart_feeder_remote/widgets/cards/app_card.dart';
import 'package:smart_feeder_remote/widgets/list_tiles/app_list_tile.dart';

class MqttLogScreen extends ConsumerStatefulWidget {
  const MqttLogScreen({super.key});

  @override
  ConsumerState<MqttLogScreen> createState() => _MqttLogScreenState();
}

class _MqttLogScreenState extends ConsumerState<MqttLogScreen> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;

    if (_controller.position.extentAfter < 200) {
      ref.read(mqttLogPageProvider.notifier).fetchNext();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqttLogPage = ref.watch(mqttLogPageProvider);
    final mqttLogList = mqttLogPage?.items ?? [];

    return mqttLogList.isEmpty
        ? const Center(child: Text('기록이 없습니다.'))
        : ListView.separated(
            controller: _controller,
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
                  onTap: () {
                    context.push('/mqtt_log_detail', extra: mqttLog);
                  },
                ),
              );
            },
          );
  }
}
