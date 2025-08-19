import 'package:flutter/material.dart';
import '../../features/question/screens/question_screen.dart';
import '../gradient_container/gradient_container.dart';

class QuizUiScreen extends StatefulWidget {
  const QuizUiScreen({super.key});

  @override
  QuizUiScreenState createState() => QuizUiScreenState();
}

List<String> SelectedAnswer = [];

class QuizUiScreenState extends State<QuizUiScreen> {
  void chooseAnswer(String answer) {
    SelectedAnswer.add(answer);
  }

  void questionScreenNavigation() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionScreen(onSelectedAnswer: chooseAnswer),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery variables
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.deepPurple,

      // App Bar
      appBar: AppBar(
        title: Center(
          child: Text(
            "Flutter Quiz",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width * 0.07, // responsive font
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.purple,
        elevation: 1,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.5,
            color: Colors.white38,
            style: BorderStyle.solid,
          ),
        ),
      ),

      // Body
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
                  width: width * 0.6, // responsive image
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  color: Colors.white70,
                ),
                SizedBox(height: height * 0.08), // spacing responsive
                Text(
                  "Learn Flutter The Fun Way!",
                  style: TextStyle(
                    fontSize: width * 0.05, // responsive font
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: height * 0.03),
                OutlinedButton.icon(
                  onPressed: questionScreenNavigation,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    elevation: 2,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.15, // responsive padding
                      vertical: height * 0.015,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 0.5,
                      style: BorderStyle.solid,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_right_alt_rounded,
                    size: width * 0.07, // responsive icon size
                    color: Colors.white,
                  ),
                  label: Text(
                    "Start Quiz",
                    style: TextStyle(fontSize: width * 0.045),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
