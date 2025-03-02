import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/onboard');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSplashScreen,
      body: Center(
        child: Image.asset(
          'images/Apps.png',
          width: 244,
          height: 244,
        ),
      ),
    );
  }
}