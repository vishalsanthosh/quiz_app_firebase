import 'package:flutter/material.dart';
import 'package:quiz_app_firebase/Widgets_Tools/colors.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({super.key, required this.result, required this.questionL, required this.onPressed});
  
  final int result;
  final int questionL;
  final VoidCallback onPressed;
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Result", 
              style: TextStyle(
                color: noSelection, 
                fontSize: 24, 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              child: Text(
                "$result/$questionL",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              radius: 60,
              backgroundColor: result == questionL / 2
                  ? Colors.yellow
                  : result < questionL / 2
                      ? wrong
                      : correct,
             
            ),
            SizedBox(height: 20),
            Text(
              result == questionL / 2
                  ? "Almost there!"
                  : result < questionL / 2
                      ? 'Try again?'
                      : 'Great job!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: result == questionL / 2
                    ? Colors.orange
                    : result < questionL / 2
                        ? Colors.red
                        : Colors.green,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                onPressed();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  "Start Over",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
