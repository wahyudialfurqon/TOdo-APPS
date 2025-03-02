import 'package:flutter/material.dart';
import 'package:todo/screens/createName_screens.dart';
import 'package:todo/screens/detailTask_screens.dart';
import 'package:todo/screens/home_screens.dart';
import 'package:todo/screens/onboard_screens.dart';
import 'package:todo/screens/splash_screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
      '/splash': (context) => const SplashScreen(),
      '/onboard': (context) => const OnboardScreens(),
      '/home': (context) => const HomeScreens(),
      '/createName': (context) => const CreateNameScreens(),
      '/detailTask': (context) => const DetailScreens(),
      },
    );
  }
}
