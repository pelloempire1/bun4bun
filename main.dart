import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'constant/color.dart';
import 'controller/auth_controller.dart';
import 'screen/auth/login_screen.dart';
import 'screen/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // make AuthController available everywhere
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
      home: const _Root(), // decides login vs home
    );
  }
}

/// Decides: logged in -> HomeScreen, logged out -> LoginScreen
class _Root extends StatelessWidget {
  const _Root({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;
        if (user == null) {
          return const LoginScreen();
        }

        return const HomeScreen();
      },
    );
  }
}
