import 'package:flutter/material.dart';
import 'QuizTimer.dart';

class JouerPage extends StatefulWidget {
  const JouerPage({Key? key}) : super(key: key);

  @override
  _JouerPageState createState() => _JouerPageState();
}

class _JouerPageState extends State<JouerPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 0.94,
              child: Container(
                height: 230,
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                decoration: ShapeDecoration(
                  color: const Color(0xFF10B2E9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 6),
                    child: Container(
                      width: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/jouer.png'),
                          fit: BoxFit.fill,
                        )
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(

            )
          ],

        ),
      ),
    );
  }
}