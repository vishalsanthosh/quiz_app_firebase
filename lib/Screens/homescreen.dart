import 'package:flutter/material.dart';
import 'package:quiz_app_firebase/Database/database_firebase.dart';
import 'package:quiz_app_firebase/Widgets_Tools/button.dart';
import 'package:quiz_app_firebase/Widgets_Tools/colors.dart';
import 'package:quiz_app_firebase/Widgets_Tools/question_pool.dart';
import 'package:quiz_app_firebase/Widgets_Tools/questions.dart';
import '../Widgets_Tools/options.dart';
import '../Widgets_Tools/result.dart';

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  var db = FirebaseData();
  late Future<List<Question>> _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestions();
  }

  @override
  void initState() {
    super.initState();
    _questions = getData();
  }

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAnswered = false;
  String selectedAnswer = '';
  String correctAnswer = '';

  void nextQuestion(int questionL) {
    if (index == questionL - 1) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => ResultBox(
          result: score,
          questionL: questionL,
          onPressed: startAgain,
        ),
      );
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAnswered = false;
          selectedAnswer = '';
          correctAnswer = '';
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

  void checkAns(bool value, String option, List<Question> extractedData) {
    if (isAnswered) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAnswered = true;
        selectedAnswer = option;
        correctAnswer = extractedData[index]
            .options
            .keys
            .firstWhere((key) =>
                extractedData[index].options[key] == true);
      });
    }
  }

  void startAgain() {
    setState(() {
      index = 0;
      score = 0;
      isAnswered = false;
      isPressed = false;
      selectedAnswer = '';
      correctAnswer = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Question>>(
      future: _questions,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        if (snapshot.hasData) {
          var extractedData = snapshot.data!;

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 233, 199, 238),
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              title: Text(
                "Quiz App",
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: const Color.fromARGB(255, 50, 150, 255),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Score: $score",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    QuestionPools(
                      que: extractedData[index].title,
                      index: index,
                      totalQue: extractedData.length,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    for (int i = 0; i < extractedData[index].options.length; i++)
                      GestureDetector(
                        onTap: () => checkAns(
                            extractedData[index]
                                .options
                                .values
                                .toList()[i],
                            extractedData[index]
                                .options
                                .keys
                                .toList()[i],
                            extractedData), // Pass extractedData here
                        child: OptionUi(
                          option: extractedData[index]
                              .options
                              .keys
                              .toList()[i],
                          color: isPressed
                              ? (selectedAnswer == extractedData[index]
                                      .options
                                      .keys
                                      .toList()[i]
                                  ? (extractedData[index]
                                          .options
                                          .values
                                          .toList()[i]
                                      ? correct
                                      : wrong)
                                  : (correctAnswer == extractedData[index]
                                          .options
                                          .keys
                                          .toList()[i]
                                      ? correct
                                      : same))
                              : same,
                        ),
                      ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            floatingActionButton: GestureDetector(
              onTap: () => nextQuestion(extractedData.length),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Buttons(),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        } else {
          return Center(child: Text("No Data Available"));
        }
      },
    );
  }
}
