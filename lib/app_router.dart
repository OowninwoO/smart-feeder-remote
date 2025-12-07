import 'package:go_router/go_router.dart';

import 'screens/auth/login_screen.dart';
import 'screens/feed/feed_screen.dart';
import 'screens/history/history_screen.dart';
import 'screens/main_screen.dart';
import 'screens/schedule/schedule_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'services/auth/auth_service.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) {
    final isLoggedIn = AuthService.currentUser != null;

    final isLoginScreen = state.matchedLocation == '/login';

    if (!isLoggedIn && !isLoginScreen) {
      return '/login';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
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
