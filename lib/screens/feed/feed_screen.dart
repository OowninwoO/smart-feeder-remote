import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../constants/app_colors.dart';
import '../../services/wifi/wifi_connector.dart';
import '../../widgets/buttons/app_text_button.dart';
import '../../widgets/list_tiles/app_list_tile.dart';
import '../../widgets/cards/app_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Divider(color: AppColors.divider),
                  Text(
                    '기기를 연결하면 원격 급식, 스케줄 급식, 급식 기록 확인까지 모두 한 곳에서 관리할 수 있어요.',
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
                  const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: AppCard(
                          color: AppColors.cardSecondary,
                          child: AppListTile(title: '키트명', subtitle: '-'),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: AppCard(
                          color: AppColors.cardSecondary,
                          child: AppListTile(title: '현재 모드', subtitle: '-'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: AppCard(
                          color: AppColors.cardSecondary,
                          child: AppListTile(title: '장소', subtitle: '-'),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: AppCard(
                          color: AppColors.cardSecondary,
                          child: AppListTile(title: 'MAC 주소', subtitle: '-'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  AppTextButton(
                    label: '스마트 급식기 등록하기',
                    onPressed: () async {
                      context.loaderOverlay.show();
                      try {
                        final success = await WifiConnector.connectWifi();
                        if (success) {
                          print('connectWifi success');
                        } else {
                          print('connectWifi failed');
                        }
                      } catch (e) {
                        print('connectWifi error: $e');
                      } finally {
                        context.loaderOverlay.hide();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
