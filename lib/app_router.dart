import 'package:go_router/go_router.dart';

import 'screens/auth/login_screen.dart';
import 'screens/feed/device_register_screen.dart';
import 'screens/feed/feed_screen.dart';
import 'screens/feed/wifi_setup_webview_screen.dart';
import 'screens/history/history_screen.dart';
import 'screens/main_screen.dart';
import 'screens/schedule/schedule_screen.dart';
import 'screens/settings/account/account_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/splash_screen.dart';
import 'services/auth/auth_service.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  redirect: (context, state) {
    final isLoggedIn = AuthService.currentUser != null;

    final isSplashScreen = state.matchedLocation == '/splash';
    final isLoginScreen = state.matchedLocation == '/login';

    if (isSplashScreen) {
      return null;
    }

    if (!isLoggedIn && !isLoginScreen) {
      return '/login';
    }

    if (isLoggedIn && isLoginScreen) {
      return '/feed';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),

    /// 급식
    GoRoute(
      path: '/wifi_setup_web_view',
      name: 'wifi_setup_web_view',
      builder: (context, state) => const WifiSetupWebViewScreen(),
    ),
    GoRoute(
      path: '/device_register',
      name: 'device_register',
      builder: (context, state) {
        final deviceId = state.extra as String;
        return DeviceRegisterScreen(deviceId: deviceId);
      },
    ),

    /// 설정
    GoRoute(
      path: '/account',
      name: 'account',
      builder: (context, state) => const AccountScreen(),
    ),

    /// 하단 탭
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/feed',
              name: 'feed',
              builder: (context, state) => const FeedScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/schedule',
              name: 'schedule',
              builder: (context, state) => const ScheduleScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/history',
              name: 'history',
              builder: (context, state) => const HistoryScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              name: 'settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
