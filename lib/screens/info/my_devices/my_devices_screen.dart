import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_feeder_remote/providers/device/device_list_provider.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/cards/app_card.dart';
import '../../../widgets/dialogs/app_confirm_dialog.dart';
import '../../../widgets/list_tiles/app_list_tile.dart';

class MyDevicesScreen extends ConsumerWidget {
  const MyDevicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devices = ref.watch(deviceListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('내 기기')),
      body: SafeArea(
        child: devices.isEmpty
            ? const Center(child: Text('등록된 기기가 없습니다.'))
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final device = devices[index];

                  return Dismissible(
                    key: ValueKey(device.deviceId),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(16),
                      child: const Icon(Icons.delete, color: Colors.red),
                    ),
                    confirmDismiss: (_) async {
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

                      if (confirmed != true) return false;

                      return true;
                    },
                    child: AppCard(
                      color: AppColors.cardPrimary,
                      child: AppListTile(
                        title: device.deviceName,
                        subtitle: '${device.deviceId} • ${device.location}',
                        onTap: () {
                          context.push('/device_detail', extra: device);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
