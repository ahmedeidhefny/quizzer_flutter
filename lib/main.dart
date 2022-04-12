import 'package:flutter/material.dart';
import 'quizzer.dart';

void main() => runApp(QuizzerApp());

class QuizzerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          title: Text('Quizzer App'),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Quizzer(),
        ),
      ),
    );
  }
}

