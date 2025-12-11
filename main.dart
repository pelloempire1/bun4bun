import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ---- FIXED IMPORTS (use relative paths, not package:social_mobile_app) ----
import 'constant/color.dart';
import 'controller/auth_controller.dart';
import 'screen/auth/login_screen.dart';
import 'screen/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Inject AuthController globally
  Get.put(AuthController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bun4Bun',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mint),
        useMaterial3: true,
      ),
      navigatorKey: Get.key,
      home: const _Root(), // decides LoginScreen or HomeScreen
    );
  }
}

/// This widget decides whether to show HomeScreen or LoginScreen
class _Root extends StatelessWidget {
  const _Root({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // waiting for Firebase
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // no user logged in → show login
        if (!snapshot.hasData) {
          return const LoginScreen();
        }

        // user logged in → go to home
        return const HomeScreen();
      },
    );
  }
}
