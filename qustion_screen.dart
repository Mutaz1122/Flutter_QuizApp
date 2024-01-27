import 'package:flutter/material.dart';
import 'package:first_app/answer_button.dart';
import 'package:first_app/data/qustions.dart';

class QustionsScreen extends StatefulWidget {
  const QustionsScreen(this.chooseAns, {super.key});
  final void Function(String ans) chooseAns;

  @override
  State<QustionsScreen> createState() {
    return _QustionsScreenState();
  }
}

class _QustionsScreenState extends State<QustionsScreen> {
  var currentIndex = 0;

  void answerQusetion(String ans) {
    widget.chooseAns(ans);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQ = questions[currentIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // <-- alignments
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(currentQ.text,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
            const SizedBox(height: 30),
            ...currentQ.getShuffeld().map((ans) {
              return AnswerButton(ans, () {
                answerQusetion(ans);
              });
            }),
          ],
        ),
      ),
    );
  }
}
