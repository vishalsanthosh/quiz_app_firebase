import 'package:flutter/material.dart';

import 'package:quiz_app_firebase/Widgets_Tools/button.dart';
import 'package:quiz_app_firebase/Widgets_Tools/colors.dart';
import 'package:quiz_app_firebase/Widgets_Tools/options.dart';
import 'package:quiz_app_firebase/Widgets_Tools/question_pool.dart';
import 'package:quiz_app_firebase/Widgets_Tools/questions.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  List<Question> _questions = [
    Question(
        id: "10",
        title: "what is 3+3?",
        options: {"5": false, "6": true, "8": false, "7": false}),
    Question(id: "11", title: "test question", options: {"6": false, "5": true})
  ];
  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAnswered = false;
  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAnswered = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please Select any options"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20),
        ));
      }
    }
  }

  void checkAns(bool value) {
    if (isAnswered) {
      return;
    } else {
      if (value == true) {
        score++;
        setState(() {
          isPressed = true;
          isAnswered = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 255),
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0)),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Score: $score"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              QuestionPools(
                  que: _questions[index].title,
                  index: index,
                  totalQue: _questions.length),
              SizedBox(
                height: 25,
              ),
              for (int i = 0; i < _questions[index].options.length; i++)
                GestureDetector(
                  onTap: () =>
                      checkAns(_questions[index].options.values.toList()[i]),
                  child: OptionUi(
                    option: _questions[index].options.keys.toList()[i],
                    color: isPressed
                        ? _questions[index].options.values.toList()[i] == true
                            ? correct
                            : wrong
                        : same,
                  ),
                )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Buttons(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
