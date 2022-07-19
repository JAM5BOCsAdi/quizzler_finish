import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(
      () {
        //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so, show and alert using rFlutter_alert, reset the questionNumber, empty out the scoreKeeper.
        //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.

        if (quizBrain.isFinished() == true) {
          Alert(
            context: context,
            type: AlertType.info,
            title: "Finished!",
            desc: "You've reached the end of the Quiz",
            buttons: [
              DialogButton(
                onPressed: () => Navigator.pop(context),
                width: 120,
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ).show();
          // Reset the questionNumber
          quizBrain.reset();
          // Empty out the scoreKeeper
          scoreKeeper = [];
        }
        //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
        else {
          if (userPickedAnswer == correctAnswer) {
            if (kDebugMode) {
              print("Got it RIGHT");
              scoreKeeper.add(
                const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              );
            }
          } else {
            if (kDebugMode) {
              print("Got it WRONG");
              scoreKeeper.add(
                const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              );
            }
          }

          quizBrain.nextQuestion();
        }
      },
    );
  }

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
                  checkAnswer(true);
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
                  checkAnswer(false);
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
