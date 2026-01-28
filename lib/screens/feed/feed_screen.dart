import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:smart_feeder_remote/constants/enums/feed_activity_status.dart';
import 'package:smart_feeder_remote/constants/enums/presence_status.dart';

import '../../constants/enums/feed_control_action.dart';
import '../../services/mqtt/mqtt_service.dart';
import '../../theme/app_colors.dart';
import '../../services/wifi/wifi_connector.dart';
import '../../utils/log_utils.dart';
import '../../widgets/buttons/app_icon_text_button.dart';
import '../../widgets/buttons/app_text_button.dart';
import '../../widgets/list_tiles/app_list_tile.dart';
import '../../widgets/cards/app_card.dart';
import '../../providers/device/primary_device_provider.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  static const TextStyle _titleStyle = TextStyle(
    color: AppColors.textOnLight,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _bodyStyle = TextStyle(color: AppColors.textOnLight);

  /// MQTT로 급식기 제어 명령을 발행합니다.
  static void _publish({
    required String? deviceId,
    required FeedControlAction action,
  }) {
    if (deviceId == null) return;

    final topic = 'feeder/$deviceId/${action.value}';
    MqttService.publish(topic: topic);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryDevice = ref.watch(primaryDeviceProvider);

    final deviceId = primaryDevice?.deviceId;
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
                  Text('스마트 급식기 리모컨', style: _titleStyle),
                  Divider(color: AppColors.divider),
                  Text(
                    '기기를 연결하면 원격 급식, 스케줄 급식, 급식 기록 확인까지 모두 한 곳에서 관리할 수 있어요.',
                    style: _bodyStyle,
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
                  const Text('기기 정보', style: _titleStyle),
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
          AppCard(
            color: AppColors.cardPrimary,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('기기 상태', style: _titleStyle),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ValueListenableBuilder<String?>(
                          valueListenable: MqttService.primaryDevicePresence,
                          builder: (_, v, __) {
                            final status = PresenceStatus.parse(v);

                            return AppCard(
                              color: AppColors.cardSecondary,
                              child: AppListTile(
                                title: '연결 상태',
                                subtitle: status.label,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: ValueListenableBuilder<String?>(
                          valueListenable:
                              MqttService.primaryDeviceActivityState,
                          builder: (_, v, __) {
                            final status = FeedActivityStatus.parse(v);

                            return AppCard(
                              color: AppColors.cardSecondary,
                              child: AppListTile(
                                title: '동작 상태',
                                subtitle: status.label,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
                  const Text('원격 급식 제어', style: _titleStyle),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: AppTextButton(
                          label: '급식 버튼',
                          onPressed: () => _publish(
                            deviceId: deviceId,
                            action: FeedControlAction.feedButton,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: AppTextButton(
                          label: '초음파 감지',
                          onPressed: () => _publish(
                            deviceId: deviceId,
                            action: FeedControlAction.ultrasonic,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: AppTextButton(
                          label: '주기 타이머',
                          onPressed: () => _publish(
                            deviceId: deviceId,
                            action: FeedControlAction.intervalTimer,
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
        ],
      ),
    );
  }
}
