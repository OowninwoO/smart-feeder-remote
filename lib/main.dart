import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import 'app_router.dart';
import 'firebase_options.dart';
import 'screens/auth/login_screen.dart';
import 'services/auth/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        builder: (context, child) {
          return StreamBuilder<User?>(
            stream: AuthService.firebaseAuth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData) {
                return const LoginScreen();
              }
              return child!;
            },
          );
        },
      ),
    );
  }
}
