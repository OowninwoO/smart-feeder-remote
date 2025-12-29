import 'package:flutter/material.dart';

import '../../../models/device/device.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/datetime_utils.dart';
import '../../../widgets/cards/app_card.dart';

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
