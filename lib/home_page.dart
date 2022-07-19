import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

/* ------------------------------ CLASS [CALLS] ------------------------------ */
QuizBrain quizBrain = QuizBrain();

/* ------------------------------ STATELESS WIDGET ------------------------------ */
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  /* ---------------- LAYOUT ---------------- */
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(
        child: MyHomePage(title: 'QuizApp Home Page'),
      ),
    );
  }
}

/* ------------------------------ STATEFUL WIDGET ------------------------------ */
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /* ---------------- VARIABLES ---------------- */
  List<Icon> scoreKeeper = [];

  /* ---------------- FUNCTIONS ---------------- */

  /* ---------------- LAYOUT ---------------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  //The user picked true.
                  bool correctAnswer = quizBrain.getQuestionAnswer();
                  if (correctAnswer == true) {
                    if (kDebugMode) {
                      print("Got it");
                    }
                  } else {
                    if (kDebugMode) {
                      print("Nope");
                    }
                  }
                  setState(() {
                    quizBrain.nextQuestion();
                  });

                  if (kDebugMode) {
                    print("True");
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  bool correctAnswer = quizBrain.getQuestionAnswer();
                  if (correctAnswer == false) {
                    if (kDebugMode) {
                      print("Got it");
                    }
                  } else {
                    if (kDebugMode) {
                      print("Nope");
                    }
                  }
                  setState(() {
                    quizBrain.nextQuestion();
                  });

                  if (kDebugMode) {
                    print("False");
                  }
                },
              ),
            ),
          ),
          //TODO: Add a Row here as your score keeper
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
