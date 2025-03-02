import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class OnboardScreens extends StatefulWidget {
  const OnboardScreens({super.key});

  @override
  State<OnboardScreens> createState() => _OnboardScreensState();
}

class _OnboardScreensState extends State<OnboardScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgAllScreens,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: "LogoHero",
              child: Image.asset(
                'images/onboard1.png',
                width: 171,
                height: 171,
              ),
            ),
             const SizedBox(height: 80),
            Text(
              'Get things done with TODo',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
             const SizedBox(height: 5),
            Text(
              'Manage tasks effortlessly with TODo!',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
             const SizedBox(height: 50),
             ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/createName');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.allButtton,
                padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
               child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                )
               ),
             )
          ],
        ),
      ),
    );
  }
}