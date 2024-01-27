import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Image(
            width: 300,
            image: AssetImage('assets/quiz-logo.png'),
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            "Learn Flutter the fun way",
            style: TextStyle(
                color: Color.fromARGB(255, 245, 230, 255), fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(onPressed: startQuiz, child: const Text("Start Quiz"))
        ],
      ),
    );
  }
}
