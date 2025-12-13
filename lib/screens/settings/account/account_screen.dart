import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../constants/app_colors.dart';
import '../../../services/auth/auth_service.dart';
import '../../../widgets/buttons/app_text_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '계정',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColors.appBarBackground,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Center(
          child: AppTextButton(
            label: '로그아웃',
            onPressed: () async {
              await AuthService.signOut();
              Phoenix.rebirth(context);
            },
          ),
        ),
      ),
    );
  }
}
