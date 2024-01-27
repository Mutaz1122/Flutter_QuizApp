import 'package:first_app/summry.dart';
import 'package:flutter/material.dart';
import 'package:first_app/data/qustions.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  ResultScreen(this.selectedAns, {super.key});
  List<String> selectedAns;

  List<Map<String, Object>> getSummry() {
    final List<Map<String, Object>> summry = [];

    for (var i = 0; i < selectedAns.length; i++) {
      summry.add({
        "index": i,
        'question': questions[i].text,
        'choosenAns': selectedAns[i],
        'correctAns': questions[i].answers[0]
      });
    }

    return summry;
  }

  @override
  Widget build(BuildContext context) {
    final summryData = getSummry();
    var numOfTotalQ = questions.length;
    var numOfCorrectQ = summryData
        .where((element) => element['choosenAns'] == element['correctAns'])
        .length;

    // print(selectedAns);
    return Center(
        child: Container(
            margin: const EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // <-- alignments
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "You answered $numOfCorrectQ out of $numOfTotalQ correctlly",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 230, 230)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Summry(summryData),
                const SizedBox(
                  height: 30,
                ),
                TextButton(onPressed: () {}, child: const Text("restart quiz"))
              ],
            )));
  }
}
