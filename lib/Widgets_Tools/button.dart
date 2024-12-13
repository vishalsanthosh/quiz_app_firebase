import 'package:flutter/material.dart';

import 'package:quiz_app_firebase/Widgets_Tools/colors.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key,required this.nextQuestion});
 final VoidCallback nextQuestion;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nextQuestion;
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(color: noSelection,borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        child: Center(child: Text("Next Question",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}