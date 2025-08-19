import 'package:flutter/material.dart';

import '../../../models/questions.dart';
import '../../../widgets/gradient_container/gradient_container.dart';
import '../../../widgets/quiz_ui/quiz_ui_screen.dart';
import '../widgets/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer; // Stores user's answers

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < questions.length; i++) {
      summary.add({
        "question_index": i,
        "questions": questions[i].text,
        "correct_answers": questions[i].answers[0],
        "user_answer": chosenAnswer[i],
      });
    }
    return summary;
  }

  void onRestart(BuildContext context) {
    chosenAnswer.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const QuizUiScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numTotalCorrectAnswers = summaryData
        .where((data) => (data["correct_answers"] == data["user_answer"]))
        .length;

    // MediaQuery for responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Quiz",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: width * 0.07, // responsive font
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
        elevation: 1,
        shape: const RoundedRectangleBorder(
          side: BorderSide(width: 1.5, color: Colors.white38),
        ),
      ),
      body: Stack(
        children: [
          GradientContainer(
            color1: Colors.purple,
            color2: Colors.deepPurple.shade900,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.05),
              Text(
                "Result",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.08, // responsive font
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: height * 0.015),
              Text(
                "You Answered $numTotalCorrectAnswers out of $numTotalQuestions Questions Correctly!",
                style: TextStyle(
                  fontSize: width * 0.045, // responsive font
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),

              // Wrap QuestionSummary inside Expanded to allow scrolling
              Expanded(child: QuestionSummary(summaryData)),

              SizedBox(height: height * 0.05),
              OutlinedButton.icon(
                onPressed: () => onRestart(context), // Pass context
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  elevation: 2,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1,
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
                  Icons.restart_alt_sharp,
                  size: width * 0.07, // responsive icon
                  color: Colors.white,
                ),
                label: Text(
                  "Restart Quiz",
                  style: TextStyle(fontSize: width * 0.045),
                ),
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ],
      ),
    );
  }
}
