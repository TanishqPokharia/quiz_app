import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correctAnswer': questions[i].answers[0],
        'userAnswer': chosenAnswers[i]
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['userAnswer'] == data['correctAnswer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15,
              ),
              textAlign: TextAlign.center),
          const SizedBox(height: 30),
          QuestionsSummary(summaryData),
          const SizedBox(height: 30),
          TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.blue),
              ),
              icon: const Icon(
                Icons.refresh,
                color: Colors.blue,
              ))
        ]),
      ),
    );
  }
}
