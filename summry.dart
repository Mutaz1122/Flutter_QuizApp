import 'package:flutter/material.dart';

class Summry extends StatelessWidget {
  const Summry(this.summryList, {super.key});

  final List<Map<String, Object>> summryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summryList.map((data) {
            return Row(
              children: [
                Text(((data['index'] as int) + 1).toString()),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(data['correctAns'] as String,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 241, 129, 198))),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(data['choosenAns'] as String,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 187, 187, 187)))
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
