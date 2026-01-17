import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:smart_feeder_remote/providers/device/device_list_provider.dart';

import '../../../api/devices_api.dart';
import '../../../services/mqtt/mqtt_service.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/datetime_utils.dart';
import '../../../utils/toast_utils.dart';
import '../../../utils/user_data_sync.dart';
import '../../../widgets/buttons/app_icon_text_button.dart';
import '../../../widgets/cards/app_card.dart';
import '../../../widgets/dialogs/app_confirm_dialog.dart';

class DeviceDetailScreen extends ConsumerWidget {
  final String deviceId;

  const DeviceDetailScreen({super.key, required this.deviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devices = ref.watch(deviceListProvider);
    final device = devices.where((d) => d.deviceId == deviceId).firstOrNull;

    return Scaffold(
      appBar: AppBar(title: const Text('기기 상세')),
      body: SafeArea(
        child: device == null
            ? const Center(child: Text('기기를 찾을 수 없습니다'))
            : ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _SectionCard(
                    icon: Icons.devices_outlined,
                    title: '기기 기본 정보',
                    items: [
                      _SectionItem(label: '기기 이름', value: device.deviceName),
                      _SectionItem(label: '기기 ID', value: device.deviceId),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SectionCard(
                    icon: Icons.location_on_outlined,
                    title: '설치 및 권한',
                    items: [
                      _SectionItem(label: '설치 위치', value: device.location),
                      _SectionItem(label: '권한', value: device.role),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SectionCard(
                    icon: Icons.event_outlined,
                    title: '등록 및 연결 날짜',
                    items: [
                      _SectionItem(
                        label: '등록일',
                        value: DateTimeUtils.ymdHm(device.createdAt),
                      ),
                      _SectionItem(
                        label: '연결일',
                        value: DateTimeUtils.ymdHm(device.linkedAt),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppIconTextButton(
                    width: double.infinity,
                    icon: const Icon(Icons.link_off),
                    label: '기기 연결 해제하기',
                    onPressed: () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (ctx) => AppConfirmDialog(
                          title: '기기 삭제',
                          content:
                              '${device.deviceName} 기기를 삭제할까요?\n삭제하면 더 이상 기기를 조작할 수 없습니다.',
                          confirmText: '삭제',
                          cancelText: '취소',
                        ),
                      );

                      if (confirmed != true) return;

                      context.loaderOverlay.show();

                      try {
                        final topic = 'feeder/${device.deviceId}/factory_reset';
                        MqttService.publish(
                          topic: topic,
                          message: 'factory_reset',
                        );

                        await DevicesApi.deleteDevice(
                          deviceId: device.deviceId,
                        );

                        await loadDevices(ref);

                        ToastUtils.success('기기를 삭제했습니다.');
                        context.pop();
                      } catch (e) {
                        ToastUtils.error('기기 삭제에 실패했습니다.');
                      } finally {
                        context.loaderOverlay.hide();
                      }
                    },
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
