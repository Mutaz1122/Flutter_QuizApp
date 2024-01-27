// ignore_for_file: unused_local_variable
import 'package:first_app/data/qustions.dart';

import 'package:first_app/qustion_screen.dart';
import 'package:first_app/result_screen.dart';
import 'package:first_app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAns = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);

    super.initState();
  }

  void chooseAns(String ans) {
    // print(ans);
    selectedAns.add(ans);

    if (selectedAns.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(selectedAns);
        selectedAns = [];
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QustionsScreen(chooseAns);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 70, 24, 149),
                Color.fromARGB(255, 104, 23, 158)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen),
    ));
  }
}
