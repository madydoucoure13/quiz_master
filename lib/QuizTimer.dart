import 'dart:async';
import 'package:flutter/material.dart';

class QuizTimer extends StatefulWidget {
  final int temps;

  const QuizTimer({Key? key, required this.temps}) : super(key: key);

  @override
  _QuizTimerState createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  int tempsRestant = 0;

  @override
  void initState() {
    super.initState();
    tempsRestant = widget.temps;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        tempsRestant--;
      });
      if (tempsRestant == 0) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: tempsRestant / widget.temps,
        strokeWidth: 5,
        backgroundColor: Colors.grey,
        valueColor: const AlwaysStoppedAnimation(Colors.yellow),

      ),
    );
  }
}
