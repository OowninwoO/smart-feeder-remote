import 'package:flutter/material.dart';

import '../../widgets/buttons/icon_text_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: IconTextButton(
            bgColor: const Color(0xFFF2F2F2),
            fgColor: const Color(0xFF1F1F1F),
            icon: Image.asset(
              'assets/icons/google_logo.png',
              width: 20,
              height: 20,
            ),
            label: 'Sign in with Google',
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
