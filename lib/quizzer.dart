import 'quiz_brain.dart';
import 'package:flutter/material.dart';


QuizBrain quizBrain = QuizBrain();

class Quizzer extends StatefulWidget {
  @override
  _QuizzerState createState() => _QuizzerState();
}

class _QuizzerState extends State<Quizzer> {
  List<Icon> icons = [];
  bool overLastQuestion = false;

  void _checkAnswer(bool userPickAnswer){
    setState(() {
      if (overLastQuestion) return;
      bool questionAnswer = quizBrain.getQuestionAnswer();
      if (questionAnswer == userPickAnswer) {
        icons.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      }
      else {
        icons.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion();
      if (quizBrain.lastQuestion()) overLastQuestion = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RawMaterialButton(
                fillColor: Colors.green,
                onPressed: () {
                  _checkAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RawMaterialButton(
                fillColor: Colors.red,
                onPressed: () {
                  _checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: icons,
          )
        ],
      ),
    );
  }
}
