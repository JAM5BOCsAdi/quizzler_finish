class Question {
  String questionText = "";
  bool questionAnswer = true;

// It's called CONSTRUCTOR
  Question({required this.questionText, required this.questionAnswer});
/*
  Same as above, but longer version:
  It's called CONSTRUCTOR

  Question({required String q, required bool a}) {
    questionText = q;
    questionAnswer = a;
  }
*/
}
