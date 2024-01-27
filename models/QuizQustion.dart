// ignore: file_names

class QuizQustion {
  QuizQustion(this.text, this.answers);

  final String text;
  final List<String> answers;
  List<String> getShuffeld() {
    final shuffeldList = List.of(answers);
    shuffeldList.shuffle();
    return shuffeldList;
  }
}
