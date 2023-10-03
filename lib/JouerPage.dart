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
        child: Center(
          heightFactor: 0.9,
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.94,
                child: Container(
                  height: 230,
                  margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF10B2E9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Container(
                      width: 300,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/jouer.png'),
                        fit: BoxFit.fill,
                      )),
                    ),
                  ),
                ),
              ),
              //const Stack(
              // children: [
              const FractionallySizedBox(
                widthFactor: 0.6,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  QuizTimer(temps: 30),
                  Text(
                    'Question 1/4',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF10B2E9),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Text(
                    'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page,',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
              ],
                ),
              )
              // ],
              //),
            ],
          ),
        ),
      ),
    );
  }
}
