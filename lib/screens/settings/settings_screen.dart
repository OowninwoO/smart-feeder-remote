import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_colors.dart';
import '../../widgets/cards/app_card.dart';
import '../../widgets/list_tiles/app_list_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppCard(
            color: AppColors.secondary,
            borderRadius: 0,
            child: AppListTile(
              title: '계정',
              onTap: () {
                context.push('/account');
              },
            ),
          ),
          const Divider(color: AppColors.divider),
        ],
      ),
    );
  }
}
