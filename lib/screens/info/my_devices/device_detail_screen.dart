import 'package:flutter/material.dart';

import '../../../models/device/device.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/cards/app_card.dart';
import '../../../widgets/list_tiles/app_list_tile.dart';

class DeviceDetailScreen extends StatelessWidget {
  final Device device;

  const DeviceDetailScreen({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기기 상세')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppCard(
              color: AppColors.cardPrimary,
              child: AppListTile(title: '기기 이름', subtitle: device.deviceName),
            ),
            const SizedBox(height: 16),
            AppCard(
              color: AppColors.cardPrimary,
              child: AppListTile(title: '기기 ID', subtitle: device.deviceId),
            ),
            const SizedBox(height: 16),
            AppCard(
              color: AppColors.cardPrimary,
              child: AppListTile(title: '설치 위치', subtitle: device.location),
            ),
            const SizedBox(height: 16),
            AppCard(
              color: AppColors.cardPrimary,
              child: AppListTile(title: '권한', subtitle: device.role),
            ),
            const SizedBox(height: 16),
            AppCard(
              color: AppColors.cardPrimary,
              child: AppListTile(
                title: '등록일',
                subtitle: device.createdAt.toIso8601String(),
              ),
            ),
            const SizedBox(height: 16),
            AppCard(
              color: AppColors.cardPrimary,
              child: AppListTile(
                title: '연결일',
                subtitle: device.linkedAt.toIso8601String(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
