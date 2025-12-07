import 'package:flutter/material.dart';

import '../../services/auth/auth_service.dart';
import '../../utils/toast_utils.dart';
import '../../widgets/buttons/app_icon_text_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AppIconTextButton(
            bgColor: const Color(0xFFF2F2F2),
            fgColor: const Color(0xFF1F1F1F),
            icon: Image.asset(
              'assets/icons/google_logo.png',
              width: 20,
              height: 20,
            ),
            label: 'Sign in with Google',
            onPressed: () async {
              try {
                await AuthService.signInWithGoogle();
              } catch (e) {
                ToastUtils.error('로그인에 실패했어요. 다시 시도해 주세요.');
              }
            },
          ),
        ),
      ),
    );
  }
}
