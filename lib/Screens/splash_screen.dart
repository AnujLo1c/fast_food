import 'dart:async';

import 'package:fast_food_app/Screens/welcome_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const WelcomePageScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(
              255,
              250,
              135,
              0,
            ),
            Color.fromARGB(255, 245, 60, 0)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              padding: EdgeInsets.all(25),
              child: Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: const TextSpan(
                  style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                  children: [
                    TextSpan(text: 'Fast '),
                    TextSpan(
                      text: 'Food',
                      style: TextStyle(
                        color: Color.fromRGBO(250, 185, 150, 1),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
