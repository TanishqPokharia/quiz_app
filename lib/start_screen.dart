import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
        //center makes the widget span the entire screen
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 250,
          height: 340,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Learn Flutter the fun way!",
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
          label: const Text(
            "Start Quiz",
            style: TextStyle(color: Colors.blue),
          ),
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.blue,
          ),
        )
      ],
    ));
  }
}
