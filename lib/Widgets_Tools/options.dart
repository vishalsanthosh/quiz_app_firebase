import 'package:flutter/material.dart';

class OptionUi extends StatelessWidget {
  const OptionUi({
    super.key,
    required this.option,
    required this.color,
  });
  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Center(
          child: Text(
            option,
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
