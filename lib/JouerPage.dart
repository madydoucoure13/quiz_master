import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'QuizTimer.dart';
import 'package:http/http.dart' as http;
import 'modeles/quiz.dart';

Future<List<Quiz>> fetchQuiz() async {
  final response = await http.get(Uri.parse('http://localhost:9090/quiz/list'), headers: {"Access-Control-Allow-Origin": "*"});

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

class JouerPage extends StatefulWidget {
  const JouerPage({Key? key}) : super(key: key);

  @override
  _JouerPageState createState() => _JouerPageState();
}

class _JouerPageState extends State<JouerPage> {

  late Future<List<Quiz>> quizList;

  @override
  void initState() {
    list();
    super.initState();
    quizList = fetchQuiz();
  }

  void list() async {
    try {
      final List<Quiz> quizList = await fetchQuiz();
      // Maintenant, vous avez une liste d'objets Quiz prêts à être utilisés.
      // Vous pouvez les afficher, les traiter, etc.
      for (final quiz in quizList) {
        print('ID: ${quiz.idQuiz}');

        print('Titre: ${quiz.titre}');
        print('Timer: ${quiz.timer}');
        print('Utilisateur: ${quiz.utilisateur.nom} ${quiz.utilisateur.prenom}');
        print('Questions:');
        for (final question in quiz.questions) {
          print('  Question ID: ${question.idQuestion}');
          print('  Contenu: ${question.contenue}');
        }
        print('-----------------------');
      }
    } catch (e) {
      print('Une erreur s\'est produite lors de la récupération des quiz : $e');
    }
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
                          'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page',
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
                child: QuestionCard(quiz: quizList)
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



  void onPressed() {

  }
}

class QuestionCard extends StatelessWidget {
  final Future<List<Quiz>> quiz;
  const QuestionCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quiz>>(
      future: quiz,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // En cours de chargement, vous pouvez afficher un indicateur de chargement ici.
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // En cas d'erreur, vous pouvez afficher un message d'erreur ici.
          return Text('Error: ${snapshot.error}');
        } else {
          // Lorsque les données sont prêtes, affichez-les.
          final quizzes = snapshot.data ?? [];
          return ListView.builder(
            itemCount: quizzes.length,
            itemBuilder: (BuildContext context, int index) {
              final quiz = quizzes[index];
              return ListTile(
                title: Text(quiz.titre),
                // Ajoutez ici d'autres éléments d'affichage ou de traitement en fonction de vos besoins.
              );
            },
          );
        }
      },
    );
  }
}
