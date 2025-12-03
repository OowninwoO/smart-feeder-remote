import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import 'app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        routerConfig: appRouter,
        title: 'Smart Feeder Remote',
      ),
    );
  }
}
