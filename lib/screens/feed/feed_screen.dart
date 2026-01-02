import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../services/mqtt/mqtt_service.dart';
import '../../theme/app_colors.dart';
import '../../services/wifi/wifi_connector.dart';
import '../../utils/log_utils.dart';
import '../../widgets/buttons/app_icon_text_button.dart';
import '../../widgets/list_tiles/app_list_tile.dart';
import '../../widgets/cards/app_card.dart';
import '../../providers/device/primary_device_provider.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryDevice = ref.watch(primaryDeviceProvider);

    final deviceName = primaryDevice?.deviceName ?? '-';
    final location = primaryDevice?.location ?? '-';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppCard(
            color: AppColors.cardPrimary,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '스마트 급식기 리모컨',
                    style: TextStyle(
                      color: AppColors.textOnLight,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(color: AppColors.divider),
                  Text(
                    '기기를 연결하면 원격 급식, 스케줄 급식, 급식 기록 확인까지 모두 한 곳에서 관리할 수 있어요.',
                    style: TextStyle(color: AppColors.textOnLight),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          AppCard(
            color: AppColors.cardPrimary,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '연결된 기기 정보',
                    style: TextStyle(
                      color: AppColors.textOnLight,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: AppCard(
                          color: AppColors.cardSecondary,
                          child: AppListTile(
                            title: '기기 이름',
                            subtitle: deviceName,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: AppCard(
                          color: AppColors.cardSecondary,
                          child: AppListTile(
                            title: '설치 위치',
                            subtitle: location,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          AppIconTextButton(
            width: double.infinity,
            icon: const Icon(Icons.add),
            label: '스마트 급식기 등록하기',
            onPressed: () async {
              context.loaderOverlay.show();
              try {
                final success = await WifiConnector.connectWifi();
                if (success) {
                  LogUtils.d('connectWifi success');
                  await WifiConnector.enableForce();
                  context.push('/wifi_setup_web_view');
                } else {
                  LogUtils.e('connectWifi failed');
                }
              } catch (e) {
                LogUtils.e('connectWifi error: $e');
              } finally {
                context.loaderOverlay.hide();
              }
            },
          ),
          const SizedBox(height: 16),
          AppIconTextButton(
            width: double.infinity,
            icon: const Icon(Icons.send),
            label: 'MQTT 테스트 발행',
            onPressed: () {
              try {
                final primaryDeviceId =
                    ref.read(primaryDeviceProvider)?.deviceId ?? '-';

                MqttService.publish(
                  topic: 'feeder/$primaryDeviceId/test',
                  message: 'test',
                );

                LogUtils.d('mqtt published: feeder/$primaryDeviceId/test');
              } catch (e) {
                LogUtils.e('mqtt publish error: $e');
              }
            },
          ),
        ],
      ),
    );
  }
}
