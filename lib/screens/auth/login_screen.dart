import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:smart_feeder_remote/services/auth/auth_service.dart';
import 'package:smart_feeder_remote/theme/app_colors.dart';
import 'package:smart_feeder_remote/utils/log_utils.dart';
import 'package:smart_feeder_remote/utils/toast_utils.dart';
import 'package:smart_feeder_remote/widgets/buttons/app_icon_text_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Smart Feeder Remote',
                style: TextStyle(
                  color: AppColors.textOnDark,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              AppIconTextButton(
                bgColor: const Color(0xFFF2F2F2),
                fgColor: const Color(0xFF1F1F1F),
                icon: Image.asset(
                  'assets/icons/google_logo.png',
                  width: 20,
                  height: 20,
                ),
                label: 'Sign in with Google',
                onPressed: () async {
                  context.loaderOverlay.show();
                  try {
                    await AuthService.signInWithGoogle();
                  } catch (e) {
                    LogUtils.e(e);
                    ToastUtils.error('로그인에 실패했습니다.');
                  } finally {
                    context.loaderOverlay.hide();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
