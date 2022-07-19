// ignore_for_file: prefer_initializing_formals

class Question {
  String questionText = "";
  bool questionAnswer = true;
/*
  It's called CONSTRUCTOR
  Question({required this.questionText, required this.questionAnswer});
*/
/*
  Same as above, but longer version:
  It's called CONSTRUCTOR
*/
  Question({required String questionText, required bool questionAnswer}) {
    this.questionText = questionText;
    this.questionAnswer = questionAnswer;
  }
}
