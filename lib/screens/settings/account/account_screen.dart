import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../services/auth/auth_service.dart';
import '../../../theme/app_colors.dart';
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
                    backgroundImage:
                        (photoUrl != null && photoUrl.isNotEmpty)
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
                await AuthService.signOut(LoginProvider.google);
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
