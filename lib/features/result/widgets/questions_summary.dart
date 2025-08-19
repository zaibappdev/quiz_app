import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Expanded(
      child: Center(
        child: SizedBox(
          width: width * 0.85, // 85% of screen width instead of fixed 300
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: summaryData.map((data) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.01, // responsive vertical spacing
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${((data["question_index"]) as int) + 1}. ',
                        style: TextStyle(
                          fontSize: width * 0.04, // responsive index font
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.tertiarySystemBackground,
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      // space between index & text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data["questions"] as String,
                              style: TextStyle(
                                fontSize: width * 0.045, // responsive font
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.white,
                              ),
                            ),
                            SizedBox(height: height * 0.005),
                            Text(
                              "Correct: ${data["correct_answers"] as String}",
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CupertinoColors.activeGreen,
                              ),
                            ),
                            Text(
                              "Your Answer: ${data["user_answer"] as String}",
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: CupertinoColors.systemRed,
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Divider(
                              height: height * 0.002,
                              color: Colors.white38,
                              thickness: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
