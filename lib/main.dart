import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'app_router.dart';
import 'auto_login_gate.dart';
import 'firebase_options.dart';
import 'services/notifications/fcm_notification_service.dart';
import 'services/notifications/local_notification_service.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    Phoenix(
      child: ProviderScope(
        retry: (retryCount, error) => null,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    /// 알림 수신 시 provider 갱신을 위해 ref 주입이 가능한 위치에서 초기화
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await LocalNotificationService.init();
      await FcmNotificationService.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp.router(
        routerConfig: appRouter,
        title: 'Smart Feeder Remote',
        theme: AppTheme.dark,
        builder: (context, child) => AutoLoginGate(child: child!),
      ),
    );
  }
}
