import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'modules/auth/screens/create_account.dart';
import 'modules/auth/screens/login.dart';
import 'navigation/home.dart';
import 'navigation/navigation.dart';
import 'navigation/profile.dart';
import 'navigation/reservations.dart';
import 'navigation/top.dart';
import 'widgets/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/register': (context) => const CreateAccount(),
        '/menu': (context) => const Navigation(),
        '/home': (context) => const Home(),
        '/top': (context) => const Top(),
        '/reservations': (context) => const Reservations(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
