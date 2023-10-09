import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'QuizTimer.dart';
import 'modeles/question.dart';
import 'modeles/quiz.dart';
import 'modeles/reponse.dart';

class JouerPage extends StatefulWidget {
  final Quiz quiz;
  const JouerPage({Key? key, required this.quiz}) : super(key: key);

  @override
  _JouerPageState createState() => _JouerPageState();
}

class _JouerPageState extends State<JouerPage> {
  int _currentQuestionIndex = 0;
  late int timeRemaining;
  bool _isAnswerSelected = false;
  bool _isButtonVisible = true;

  void testeVariable(int newValue){
    timeRemaining = newValue;
  }

    void _revealAnswer() {
    final Question question = widget.quiz.questions[_currentQuestionIndex];
    final Reponse correctAnswer = question.reponses.firstWhere((answer) =>
    answer.correct);

    for (int i = 0; i < question.reponses.length; i++) {
      final Reponse answer = question.reponses[i];
      if (answer == correctAnswer) {
        answer.icon = Icons.check_circle;
      } else {
        answer.icon = Icons.close;
      }
    }
    setState(() {});

    Future.delayed(const Duration(seconds: 4), () {
      _currentQuestionIndex++;
      // _startTimer();
    });
  }

    void _onTimerFinished() {
    setState(() {
      timeRemaining = 0;
      _isAnswerSelected = false;
      _isButtonVisible = true;
    });
    _revealAnswer();
  }

  void _checkAnswer(int answerIndex) {
    final Question question = widget.quiz.questions[_currentQuestionIndex];
    final bool isCorrect = question.reponses[answerIndex].correct;

    setState(() {
      _isAnswerSelected = false;
      _isButtonVisible = true;
    });

    if (isCorrect) {
      _showSuccessIcon(answerIndex);
    } else {
      _showFailedIcon(answerIndex);
    }
  }

  void _showSuccessIcon(int answerIndex) {
    final Question question = widget.quiz.questions[_currentQuestionIndex];
    question.reponses[answerIndex].icon = Icons.check_circle;
    setState(() {});
  }

  void _showFailedIcon(int answerIndex) {
    final Question question = widget.quiz.questions[_currentQuestionIndex];
    question.reponses[answerIndex].icon = Icons.close;
    setState(() {});
  }

  void _onSkipQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _isButtonVisible = true;
    });
  }

  void _onAnswerSelected(int answerIndex) {
    setState(() {
      _isAnswerSelected = true;
      _isButtonVisible = false;
    });
    _checkAnswer(answerIndex);
  }

  @override
  void initState() {
    list();
    super.initState();
  }

  void list() {
    try {
        print('ID: ${widget.quiz.idQuiz}');
        print('Titre: ${widget.quiz.titre}');
        print('Timer: ${widget.quiz.timer}');
        print('Utilisateur: ${widget.quiz.utilisateur.nom} ${widget.quiz.utilisateur.prenom}');
        print('Questions:');
        final List<Question> quetions = widget.quiz.questions;
        // final List<Reponse> responses = que.reponses;
        for (final question in quetions) {
          print('  Question ID: ${question.idQuestion}');
          print('  Contenu: ${question.contenue}');
          final List<Reponse> responses = question.reponses;
          for (final response in responses) {
            print('    Réponse ID: ${response.idReponse}');
            print('    Contenu: ${response.contenue}');
            print('    Correcte: ${response.correct}');
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
                 Positioned(
                  top: 170,
                  left: 140,
                  child: QuizTimer(temps: 30, changeRemaining: testeVariable),
                ),
              ]),
              // Expanded(
              //   child: QuestionCard(quiz: quizList)
              // ),
              TextButton(
                  onPressed: _onSkipQuestion,
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

  Widget _buildBody() {
    if (timeRemaining == 0) {
      _revealAnswer();
    }

    return Column(
      children: [
        _buildQuestion(),
        _buildAnswers(),
        // _buildButton(),
      ],
    );
  }

  Widget _buildQuestion() {
    final Question question = widget.quiz.questions[_currentQuestionIndex];
    return Text(question.contenue);
  }

  Widget _buildAnswers() {
    final List<dynamic> answers = widget.quiz.questions[_currentQuestionIndex]
        .reponses;
    return ListView.builder(
        itemCount: answers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _onAnswerSelected(index);
            },
            child: ListTile(
              title: Text(answers[index].contenue),
              trailing: Icon(answers[index].icon),
            ),
          );
        }
    );
  }
}










// class QuestionCard extends StatelessWidget {
//   final Future<List<Quiz>> quiz;
//   const QuestionCard({super.key, required this.quiz});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Quiz>>(
//       future: quiz,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // En cours de chargement, vous pouvez afficher un indicateur de chargement ici.
//           return const CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           // En cas d'erreur, vous pouvez afficher un message d'erreur ici.
//           return Text('Error: ${snapshot.error}');
//         } else {
//           // Lorsque les données sont prêtes, affichez-les.
//           final quizzes = snapshot.data ?? [];
//           return ListView.builder(
//             itemCount: quizzes.length,
//             itemBuilder: (BuildContext context, int index) {
//               final quiz = quizzes[index];
//               return ListTile(
//                 title: Text(quiz.titre),
//                 // Ajoutez ici d'autres éléments d'affichage ou de traitement en fonction de vos besoins.
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
