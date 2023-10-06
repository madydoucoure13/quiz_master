import 'dart:convert';

import 'package:flutter/material.dart';
import 'QuizTimer.dart';
import 'package:http/http.dart' as http;
import 'data.dart';

class JouerPage extends StatefulWidget {
  const JouerPage({Key? key}) : super(key: key);

  @override
  _JouerPageState createState() => _JouerPageState();
}

class _JouerPageState extends State<JouerPage> {
  final List<Response> responses = [
    const Response(' first response ', false),
    const Response(' first response ', false),
    const Response(' first response ', true),
    const Response(' first response ', false),
  ];

  late Future<List<Quiz>> quizList;
  @override
  void initState() {
    super.initState();
    quizList = fetchQuiz();
    print(quizList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(children: [
                FractionallySizedBox(
                  widthFactor: 0.94,
                  child: Container(
                    height: 230,
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                    margin: const EdgeInsets.fromLTRB(20, 230, 0, 0),
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
                  top: 170,
                  left: 140,
                  child: QuizTimer(temps: 30),
                ),
              ]),
              Expanded(
                child: ListView.builder(
                  itemCount: responses.length,
                  itemBuilder: (context, index) {
                    return QuestionCard(response: responses[index]);
                  },
                ),
              ),
              TextButton(
                  onPressed: onPressed,
                  child: const Text(
                    'Passer  >>',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF060A5B),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Quiz>> fetchQuiz() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/quiz/list'));

    if (response.statusCode == 200) {
      // Si le serveur renvoie une réponse 200 OK, vous devez analyser une liste de quiz.
      final List<dynamic> quizJsonList = jsonDecode(response.body);
      final List<Quiz> quizzes = quizJsonList.map((quizJson) => Quiz.fromJson(quizJson)).toList();
      return quizzes;
    } else {
      // Si le serveur ne renvoie pas une réponse 200 OK, lancez une exception.
      throw Exception('Failed to load quizzes');
    }
  }

  void onPressed() {

  }
}

class QuestionCard extends StatelessWidget {
  final Response response;
  const QuestionCard({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 302,
          height: 45,
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          decoration: ShapeDecoration(
            color: const Color(0xFFF7F7F7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            shadows: const [
              BoxShadow(
                color: Color(0xFF10B2E9),
                blurRadius: 4,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                 '1 .',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              Text(
                 response.libele,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Container(
                width: 24,
                height: 24,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Icon( Icons.close),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Response {
  final String libele;
  final bool trueResponse;

  const Response(this.libele, this.trueResponse);
}
