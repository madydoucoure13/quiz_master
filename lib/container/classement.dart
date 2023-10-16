import 'package:flutter/material.dart';
import 'package:quiz_master/container/true_image_classement.dart';

class ClassementPage extends StatelessWidget {
  const ClassementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Les Classements",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 0.7),
              ),
            ),
          ),
          TrueClassementPage(),
        ],
      ),
    );
  }
}
