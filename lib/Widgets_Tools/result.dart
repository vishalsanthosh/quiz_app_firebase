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
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Result", 
              style: TextStyle(color: noSelection, fontSize: 20),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              child: Text("$result/$questionL"),
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
                  ? "Almost there"
                  : result < questionL / 2
                      ? 'Try again?'
                      : 'Great!',
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                onPressed();
              },
              child: Text("Start Over"),
            ),
          ],
        ),
      ),
    );
  }
}
