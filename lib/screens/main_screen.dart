import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Smart Feeder Remote',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appBarBackground,
      ),
      backgroundColor: AppColors.scaffoldBackground,
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.bottomNavBackground,
        indicatorColor: AppColors.primary,
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(color: AppColors.textPrimary),
        ),
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (i) {
          navigationShell.goBranch(i);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.pets, color: AppColors.textPrimary),
            label: '급식',
          ),
          NavigationDestination(
            icon: Icon(Icons.schedule, color: AppColors.textPrimary),
            label: '스케줄',
          ),
          NavigationDestination(
            icon: Icon(Icons.history, color: AppColors.textPrimary),
            label: '기록',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings, color: AppColors.textPrimary),
            label: '설정',
          ),
        ],
      ),
    );
  }
}
