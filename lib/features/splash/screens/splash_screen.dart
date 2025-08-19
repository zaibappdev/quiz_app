import 'dart:async';
import 'package:flutter/material.dart';
import '../../../widgets/gradient_container/gradient_container.dart';
import '../../../widgets/quiz_ui/quiz_ui_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const QuizUiScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Stack(
        children: [
          GradientContainer(
            color1: Colors.purple,
            color2: Colors.deepPurple.shade900,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/quiz-logo.png",
                  width: width * 0.5, // 50% of screen width
                ),
                SizedBox(height: height * 0.03), // 3% of screen height
                Text(
                  "Welcome to Flutter Quiz",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.06, // responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
