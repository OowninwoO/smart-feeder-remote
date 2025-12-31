import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_feeder_remote/providers/device/device_list_provider.dart';
import 'package:smart_feeder_remote/providers/device/primary_device_provider.dart';

import '../../theme/app_colors.dart';
import '../buttons/app_text_button.dart';
import '../cards/app_card.dart';
import '../list_tiles/app_list_tile.dart';

class PrimaryDeviceSelectDialog extends ConsumerWidget {
  const PrimaryDeviceSelectDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceList = ref.watch(deviceListProvider);
    final primaryDevice = ref.watch(primaryDeviceProvider);

    return Dialog(
      backgroundColor: AppColors.scaffoldBackground,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '대표 기기 선택',
              style: TextStyle(
                color: AppColors.textOnDark,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            if (deviceList.isEmpty) ...[
              const Text(
                '등록된 기기가 없습니다.',
                style: TextStyle(
                  color: AppColors.textOnDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ] else ...[
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: deviceList.length,
                itemBuilder: (context, index) {
                  final device = deviceList[index];
                  final deviceName = device.deviceName;
                  final location = device.location;

                  final isSelected = primaryDevice?.deviceId == device.deviceId;

                  return AppCard(
                    color: AppColors.cardPrimary,
                    child: AppListTile(
                      title: deviceName,
                      subtitle: location,
                      showTrailing: isSelected,
                      trailingIcon: Icons.check,
                      onTap: () {
                        ref.read(primaryDeviceProvider.notifier).set(device);
                      },
                    ),
                  );
                },
              ),
            ],
            const SizedBox(height: 16),
            AppTextButton(
              width: double.infinity,
              label: '닫기',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
