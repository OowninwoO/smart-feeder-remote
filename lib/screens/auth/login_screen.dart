import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../services/auth/auth_service.dart';
import '../../theme/app_colors.dart';
import '../../utils/log_utils.dart';
import '../../utils/toast_utils.dart';
import '../../utils/user_data_sync.dart';
import '../../widgets/buttons/app_icon_text_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    await upsertFcmToken();
                    await loadDevices(ref);
                    await loadMqttLogs(ref);
                    await initMqttSub(ref);
                    context.go('/feed');
                  } catch (e) {
                    LogUtils.e(e);
                    ToastUtils.error('로그인에 실패했습니다. 다시 시도해 주세요.');
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
