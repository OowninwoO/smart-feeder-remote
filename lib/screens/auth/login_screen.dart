import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../services/auth/auth_service.dart';
import '../../theme/app_colors.dart';
import '../../utils/toast_utils.dart';
import '../../widgets/buttons/app_icon_text_button.dart';
import '../../widgets/cards/app_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black45, Colors.white],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/app_icon_transparent.png',
                      width: 128,
                      height: 128,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '스마트 급식기 리모컨',
                      style: TextStyle(
                        color: AppColors.textOnLight,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '로그인',
              style: TextStyle(
                color: AppColors.textOnDark,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 2,
              child: AppCard(
                color: AppColors.secondary,
                elevation: 5.0,
                borderRadius: 30.0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Image.asset('assets/images/login_hero.png'),
                      const SizedBox(height: 16),
                      const _CheckItem(text: '원격으로 급식기를 제어하세요'),
                      const SizedBox(height: 8),
                      const _CheckItem(text: '급식 기록과 상태를 한눈에 확인하세요'),
                      const SizedBox(height: 8),
                      const _CheckItem(text: '스케줄로 자동 급식을 설정하세요'),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                  context.go('/feed');
                                } catch (e) {
                                  ToastUtils.error('로그인에 실패했습니다. 다시 시도해 주세요.');
                                } finally {
                                  context.loaderOverlay.hide();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  final String text;

  const _CheckItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, size: 24, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.textOnLight,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
