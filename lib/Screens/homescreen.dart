import 'package:flutter/material.dart';
import 'package:quiz_app_firebase/QuizModel/button.dart';
import 'package:quiz_app_firebase/QuizModel/question_pool.dart';
import 'package:quiz_app_firebase/QuizModel/questions.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  List<Question> _questions=[
    Question(id: "10", title: "what is what", options: {
      "5":false,"6":true
    })
  ];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 35, 99),
      appBar: AppBar(
        title: Text("Quiz App",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 21, 35, 99),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
             QuestionPools(que: _questions[index].title,
              index: index,
               totalQue: _questions.length)
            ],
          ),
        ),
      ),
      floatingActionButton: Buttons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}