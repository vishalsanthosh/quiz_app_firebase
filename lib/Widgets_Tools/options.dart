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
    return Center(
      child: Card(
        color: color,
        child: Center(
          child: ListTile(
            title: Center(
              child: Text(
                option,
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
