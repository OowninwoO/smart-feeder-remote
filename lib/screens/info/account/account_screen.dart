import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../services/auth/auth_service.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/log_utils.dart';
import '../../../widgets/dialogs/app_confirm_dialog.dart';
import '../../../widgets/list_tiles/app_list_tile.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.currentUser;
    final name = user?.displayName ?? 'Unknown';
    final email = user?.email ?? '-';
    final photoUrl = user?.photoURL;

    return Scaffold(
      appBar: AppBar(title: const Text('계정')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.cardPrimary,
              padding: const EdgeInsets.all(40),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.primary,
                    foregroundImage: (photoUrl != null && photoUrl.isNotEmpty)
                        ? NetworkImage(photoUrl)
                        : null,
                    onForegroundImageError: (e, s) {
                      LogUtils.e(e);
                    },
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: AppColors.textOnLight,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: const TextStyle(color: AppColors.textOnLight),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppListTile(
              onDark: true,
              title: '로그아웃',
              onTap: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => const AppConfirmDialog(
                    title: '로그아웃',
                    content: '정말 로그아웃할까요?',
                    confirmText: '로그아웃',
                    cancelText: '취소',
                  ),
                );

                if (confirmed != true) return;

                await AuthService.signOut();
                Phoenix.rebirth(context);
              },
            ),
            const Divider(color: AppColors.divider),
          ],
        ),
      ),
    );
  }
}
