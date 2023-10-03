import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';

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
    return
      Center(
        child: Container(
          width: 80,
            height: 100,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
          child: CircularPercentIndicator(
            radius: 30,
            lineWidth: 5,
            percent: tempsRestant / widget.temps,
            progressColor: Colors.amberAccent,
            backgroundColor: Colors.white,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              '$tempsRestant',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF10B2E9),
              ),
            ),
          ),
        )

    );
  }
}
