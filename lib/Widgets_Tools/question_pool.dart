import 'package:flutter/material.dart';

import 'package:quiz_app_firebase/Widgets_Tools/colors.dart';

class QuestionPools extends StatelessWidget {
  const QuestionPools({super.key,required this.que,required this.index,required this.totalQue});
  final String  que;
  final int index;
  final int totalQue;

  @override
  Widget build(BuildContext context) {
    return Container(
     alignment: Alignment.centerLeft,
     child: Center(
       child: Text("$que",style: TextStyle(fontSize: 18,
       color: noSelection
       ),),
     ),
    );
  }
}