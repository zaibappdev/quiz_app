import 'package:flutter/material.dart';
import '../../../models/questions.dart';
import '../../../widgets/elevated_button/elevated_button.dart';
import '../../../widgets/gradient_container/gradient_container.dart';
import '../../../widgets/quiz_ui/quiz_ui_screen.dart';
import '../../result/screens/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  QuestionScreenState createState() => QuestionScreenState();
}

class QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;

  void nextQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);

    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        // Navigate to result screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(chosenAnswer: SelectedAnswer),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        backgroundColor: Colors.purple,
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Question Image
                Container(
                  width: width * 0.75, // 75% of screen width
                  height: height * 0.28, // 28% of screen height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      image: AssetImage(questions[questionIndex].imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),

                // Question Text
                Center(
                  child: SizedBox(
                    width: width * 0.8, // responsive width
                    child: Text(
                      questions[questionIndex].text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.05, // responsive font
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04),

                // Answer Buttons
                ...questions[questionIndex].getShuffledAnswers().map((answer) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, // spacing between buttons
                      horizontal: width * 0.05,
                    ),
                    child: AnswerButton(
                      answerText: answer,
                      onTap: () => nextQuestion(answer),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
