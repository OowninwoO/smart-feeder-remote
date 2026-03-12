import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:smart_feeder_remote/services/auth/auth_service.dart';
import 'package:smart_feeder_remote/services/mqtt/mqtt_service.dart';
import 'package:smart_feeder_remote/theme/app_colors.dart';
import 'package:smart_feeder_remote/utils/toast_utils.dart';
import 'package:smart_feeder_remote/widgets/dialogs/app_confirm_dialog.dart';
import 'package:smart_feeder_remote/widgets/list_tiles/app_list_tile.dart';

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
                    content: '정말 로그아웃하시겠습니까?',
                    confirmText: '로그아웃',
                    cancelText: '취소',
                  ),
                );

                if (confirmed != true) return;

                try {
                  MqttService.disconnect();
                  await AuthService.signOut();
                  Phoenix.rebirth(context);
                } catch (e) {
                  ToastUtils.error('로그아웃에 실패했습니다. 다시 시도해주세요.');
                }
              },
            ),
            const Divider(color: AppColors.divider),
            AppListTile(
              onDark: true,
              title: '회원탈퇴',
              onTap: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => const AppConfirmDialog(
                    title: '회원탈퇴',
                    content: '정말 회원탈퇴하시겠습니까?\n탈퇴 시 계정이 삭제되며, 연결된 기기는 해제됩니다.',
                    confirmText: '탈퇴',
                    cancelText: '취소',
                  ),
                );

                if (confirmed != true) return;

                try {
                  MqttService.disconnect();
                  await AuthService.withdraw();
                  Phoenix.rebirth(context);
                } catch (e) {
                  ToastUtils.error('회원탈퇴에 실패했습니다. 다시 시도해주세요.');
                }
              },
            ),
            const Divider(color: AppColors.divider),
          ],
        ),
      ),
    );
  }
}
