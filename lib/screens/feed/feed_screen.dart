import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../widgets/buttons/app_text_button.dart';
import '../../widgets/list_tiles/app_list_tile.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            color: AppColors.cardPrimary,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '스마트 급식기 리모컨',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '기기를 연결하면 원격 급식, 스케줄 급식, 급식 기록 확인까지 모두 한 곳에서 관리할 수 있어요.',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            color: AppColors.cardPrimary,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.pets, size: 80, color: Colors.black),
                        SizedBox(height: 8),
                        AppTextButton(label: '스마트 급식기 등록하기', onPressed: null),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                          margin: EdgeInsets.zero,
                          clipBehavior: Clip.antiAlias,
                          color: AppColors.cardSecondary,
                          child: AppListTile(title: '키트명', subtitle: '-'),
                        ),
                        SizedBox(height: 8),
                        Card(
                          margin: EdgeInsets.zero,
                          clipBehavior: Clip.antiAlias,
                          color: AppColors.cardSecondary,
                          child: AppListTile(title: '장소', subtitle: '-'),
                        ),
                        SizedBox(height: 8),
                        Card(
                          margin: EdgeInsets.zero,
                          clipBehavior: Clip.antiAlias,
                          color: AppColors.cardSecondary,
                          child: AppListTile(title: 'MAC 주소', subtitle: '-'),
                        ),
                      ],
                    ),
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
