import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../services/auth/auth_service.dart';
import '../../widgets/buttons/app_text_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppTextButton(
        label: '로그아웃',
        onPressed: () async {
          await AuthService.signOut();
          Phoenix.rebirth(context);
        },
      ),
    );
  }
}
