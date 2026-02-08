import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_feeder_remote/models/mqtt_log/item/mqtt_log_display.dart';
import 'package:smart_feeder_remote/providers/mqtt_log/mqtt_log_page_provider.dart';
import 'package:smart_feeder_remote/theme/app_colors.dart';
import 'package:smart_feeder_remote/utils/datetime_utils.dart';
import 'package:smart_feeder_remote/widgets/buttons/app_icon_button.dart';
import 'package:smart_feeder_remote/widgets/cards/app_card.dart';
import 'package:smart_feeder_remote/widgets/list_tiles/app_list_tile.dart';

class MqttLogListScreen extends ConsumerStatefulWidget {
  const MqttLogListScreen({super.key});

  @override
  ConsumerState<MqttLogListScreen> createState() => _MqttLogListScreenState();
}

class _MqttLogListScreenState extends ConsumerState<MqttLogListScreen> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;

    if (_controller.position.extentAfter < 200) {
      ref.read(mqttLogPageProvider.notifier).fetchNext();
    }
  }

  void _scrollToTop() {
    if (!_controller.hasClients) return;

    _controller.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
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

    if (mqttLogList.isEmpty) {
      return const Center(child: Text('기록이 없습니다.'));
    }

    return Stack(
      children: [
        ListView.separated(
          controller: _controller,
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemCount: mqttLogList.length,
          itemBuilder: (context, index) {
            final mqttLog = mqttLogList[index];
            final display = MqttLogDisplay.parse(
              topic: mqttLog.topic,
              payload: mqttLog.payload,
            );

            return AppCard(
              color: AppColors.cardPrimary,
              child: AppListTile(
                title: display.title,
                subtitle:
                    '${display.category} • ${mqttLog.deviceId} • ${DateTimeUtils.ymdHms(mqttLog.receivedAt)}',
                onTap: () {
                  context.push('/mqtt_log_detail', extra: mqttLog.id);
                },
              ),
            );
          },
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: AppIconButton(
            icon: Icons.arrow_upward,
            onPressed: _scrollToTop,
          ),
        ),
      ],
    );
  }
}
