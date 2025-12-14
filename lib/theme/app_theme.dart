import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appBarBackground,
        foregroundColor: AppColors.textOnDark,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.bottomNavBackground,
        indicatorColor: AppColors.primary,
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(color: AppColors.textOnDark),
        ),
        iconTheme: WidgetStatePropertyAll(
          IconThemeData(color: AppColors.textOnDark),
        ),
      ),
    );
  }
}
