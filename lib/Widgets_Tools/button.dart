import 'package:flutter/material.dart';

import 'package:quiz_app_firebase/Widgets_Tools/colors.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key,});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(color: noSelection,borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: Center(child: Text("Next Question",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
    );
  }
}