import 'package:go_router/go_router.dart';
import 'package:smart_feeder_remote/screens/auth/login_screen.dart';
import 'package:smart_feeder_remote/screens/feed/device_register_screen.dart';
import 'package:smart_feeder_remote/screens/feed/feed_screen.dart';
import 'package:smart_feeder_remote/screens/feed/wifi_setup_webview_screen.dart';
import 'package:smart_feeder_remote/screens/history/mqtt_log_detail_screen.dart';
import 'package:smart_feeder_remote/screens/history/mqtt_log_list_screen.dart';
import 'package:smart_feeder_remote/screens/info/account/account_screen.dart';
import 'package:smart_feeder_remote/screens/info/info_screen.dart';
import 'package:smart_feeder_remote/screens/info/my_devices/device_detail_screen.dart';
import 'package:smart_feeder_remote/screens/info/my_devices/device_list_screen.dart';
import 'package:smart_feeder_remote/screens/main_screen.dart';
import 'package:smart_feeder_remote/screens/schedule/schedule_screen.dart';
import 'package:smart_feeder_remote/services/auth/auth_service.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/feed',
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

    /// 기록
    GoRoute(
      path: '/mqtt_log_detail',
      name: 'mqtt_log_detail',
      builder: (context, state) {
        final mqttLogId = state.extra as int;
        return MqttLogDetailScreen(mqttLogId: mqttLogId);
      },
    ),

    /// 정보
    GoRoute(
      path: '/device_list',
      name: 'device_list',
      builder: (context, state) => const DeviceListScreen(),
    ),
    GoRoute(
      path: '/device_detail',
      name: 'device_detail',
      builder: (context, state) {
        final deviceId = state.extra as String;
        return DeviceDetailScreen(deviceId: deviceId);
      },
    ),
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
              path: '/mqtt_log_list',
              name: 'mqtt_log_list',
              builder: (context, state) => const MqttLogListScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/info',
              name: 'info',
              builder: (context, state) => const InfoScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
