import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';
import '../../widgets/list_tiles/app_list_tile.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.cardPrimary,
            padding: const EdgeInsets.all(40),
            alignment: Alignment.center,
            child: const Text(
              '앱 정보',
              style: TextStyle(
                color: AppColors.textOnLight,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          AppListTile(
            onDark: true,
            title: '계정',
            onTap: () {
              context.push('/account');
            },
          ),
          const Divider(color: AppColors.divider),
        ],
      ),
    );
  }
}
