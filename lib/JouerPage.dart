import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'QuizTimer.dart';
import 'modeles/question.dart';
import 'modeles/quiz.dart';
import 'modeles/reponse.dart';
// import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JouerPage extends StatefulWidget {
  final Quiz quiz;
  const JouerPage({Key? key, required this.quiz}) : super(key: key);

  @override
  _JouerPageState createState() => _JouerPageState();
}

class _JouerPageState extends State<JouerPage> {
  int _currentQuestionIndex = 1;
  late int timeRemaining;
  bool _isButtonVisible = true;
  late  int questionLength = widget.quiz.questions.length;

  void testeVariable(int newValue){
    timeRemaining = newValue;
  }

  void _onTimerFinished() {
    final answerProvider = Provider.of<AnswerProvider>(context, listen: false);
    answerProvider.selectAnswer();
    Future.delayed(const Duration(seconds: 4), () {
      answerProvider.deselectAnswer();
      _currentQuestionIndex++;
    });
  }

  void _onSkipQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _isButtonVisible = true;
    });
  }

  void _onAnswerSelected(int answerIndex) {
    final Question question = widget.quiz.questions[_currentQuestionIndex - 1];
    _onTimerFinished();
    // return question.reponses[answerIndex];
  }

  @override
  void initState() {
    list();
    super.initState();
    questionLength;
    timeRemaining = widget.quiz.timer;
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
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                         Text(
                          "Question $_currentQuestionIndex/$questionLength",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF10B2E9),
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                         _buildQuestion(),
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
              Expanded(
                child: _buildAnswers(),
              ),
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

  Widget _buildQuestion() {
    if (timeRemaining == 0) {
      _onTimerFinished();
    }
    final Question question = widget.quiz.questions[_currentQuestionIndex - 1];
    return Text(
        question.contenue,
        textAlign: TextAlign.center,
        style: const TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    );
  }

  Widget _buildAnswers() {
    final List<Reponse> answers = widget.quiz.questions[_currentQuestionIndex - 1].reponses;
    final answerProvider = Provider.of<AnswerProvider>(context);
     Reponse? responseSelected;
    return ListView.builder(
        itemCount: answers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              answerProvider.selectAnswer();
              responseSelected = answers[index];
              _onTimerFinished();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Text((index + 1).toString()),
                Expanded(
                  child: Text(answers[index].contenue),
                ),
                SizedBox(
                  width: 24, // Largeur fixe pour l'icône
                  child: ConditionalBuilder(
                    condition: answerProvider._isAnswerSelected,
                    builder: (context) {
                      // Vérifiez les conditions et renvoyez l'icône appropriée
                      if (answers[index].correct) {
                        return const Icon(Icons.check_circle); // Réponse correcte sélectionnée
                      } else if (!answers[index].correct && answers[index] == responseSelected) {
                        return const Icon(Icons.check_circle); // Réponse incorrecte sélectionnée
                      } else {
                        return const SizedBox(); // Réponse incorrecte non sélectionnée (espace vide)
                      }
                    },
                    fallback: null,
                  ),
                ),
              ],
            )


          );
        }
    );
  }
}

class AnswerProvider with ChangeNotifier {
  bool _isAnswerSelected = false;
  final int _score = 0;

  bool get isAnswerSelected => _isAnswerSelected;
  int get score => _score;

  void selectAnswer() {
    _isAnswerSelected = true;
    notifyListeners();
  }

  void deselectAnswer() {
    _isAnswerSelected = false;
    notifyListeners();
  }
}
