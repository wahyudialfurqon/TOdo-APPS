import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _scale = 0.9;
  double _opacity = 1.0;

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds: 500), (){
      setState(() {
        _scale = 1.2;
      });
    });

    super.initState(); // Fade out mulai
    Future.delayed(Duration (seconds: 2), (){
      setState(() {
        _opacity = 0.0;
      });
    });

    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/onboard');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSplashScreen,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 800),
          curve: Curves.easeOut,
          child: AnimatedScale(
            scale: _scale,
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
            child: Hero(
              tag: "LogoHero",
              child: Image.asset(
                'images/Apps.png',
                width: 244,
                height: 244,
              ),
            ),
          ),
        ),
      ),
    );
  }
}