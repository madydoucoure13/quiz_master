import 'package:flutter/material.dart';
import 'package:quiz_master/container/true_score.dart';

import 'charts.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Mon évolution",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 0.7),
              ),
            ),
          ),
          ChartsPage(),
          TrueScorePage(),
        ],
      ),
    );
  }
}
