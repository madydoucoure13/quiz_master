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
              Stack(
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
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Container(
                    height: 140,
                    margin: const EdgeInsets.fromLTRB(20, 250, 0, 0),
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x9910B2E9),
                          blurRadius: 4,
                          offset: Offset(0, 1),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
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
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                    top: 190,
                    left: 130,
                    child: QuizTimer(temps: 30),
                  ),
            ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
