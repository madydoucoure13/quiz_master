import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:quiz_master/fetchData.dart';
import 'QuizTimer.dart';
import 'modeles/participer.dart';
import 'modeles/question.dart';
import 'modeles/quiz.dart';
import 'modeles/reponse.dart';
import 'package:flutter/material.dart';
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
  bool _isQuestionFinished = false;
  int selectedResponseIndex= -1;
  late  int questionLength = widget.quiz.questions.length;

  void testeVariable(int newValue){
    timeRemaining = newValue;
    if (timeRemaining == 0) {
      _onTimerFinished();
    }
  }

  void _onTimerFinished() {
    final answerProvider = Provider.of<AnswerProvider>(context, listen: false);
    answerProvider.selectAnswer();
    Future.delayed(const Duration(seconds: 4), () {
      if(_currentQuestionIndex < widget.quiz.questions.length) {
        _currentQuestionIndex++;
      } if(_currentQuestionIndex == widget.quiz.questions.length) {
        setState(() {
          _isQuestionFinished = true;
          answerProvider._isAnswerSelected = false;
        });
      }
      answerProvider.deselectAnswer();
      answerProvider._score += (timeRemaining * 100);
    });
  }

  void _onQuizFinished() {
    final answerProvider = Provider.of<AnswerProvider>(context, listen: false);
    Participer participer = Participer(
      score: answerProvider.score,
      level: 1,
      terminer: true,
      userId: 1,
      quizId: widget.quiz.idQuiz,);
    print(participer.quizId);
    createParticiper(participer);
    answerProvider._score = 0;
  }

  void _onSkipQuestion() {
    final answerProvider = Provider.of<AnswerProvider>(context, listen: false);
    setState(() {
      if(_currentQuestionIndex < widget.quiz.questions.length) {
        _currentQuestionIndex++;
        answerProvider._isAnswerSelected = true;
      } else {
        answerProvider._isAnswerSelected = false;
        testeVariable(-1);
      }
    });
    answerProvider.deselectAnswer();
    // testeVariable(widget.quiz.timer);
  }

  void _onAnswerSelected(int index) {
    setState(() {
      selectedResponseIndex = index;
    });
  }


  @override
  void initState() {
    super.initState();
    questionLength;
    timeRemaining = widget.quiz.timer;
  }

  @override
  Widget build(BuildContext context) {
    final answerProvider = Provider.of<AnswerProvider>(context);
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
                    margin: const EdgeInsets.fromLTRB(20, 230, 0, 10),
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
                  left: (MediaQuery.of(context).size.width - 120) / 2,
                  child: QuizTimer(
                    temps: widget.quiz.timer,
                    changeRemaining: testeVariable,
                    stopTimer: answerProvider._isAnswerSelected,
                    isLastQuestion: _isQuestionFinished,
                  ),
                ),
              ]),
              Expanded(
                child: _buildAnswers(),
              ),
              TextButton(
                  onPressed: _isQuestionFinished ? _onQuizFinished : _onSkipQuestion,
                  child:  Text(
                    _isQuestionFinished ? 'Terminer' : 'Passer  >>',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
        itemCount: answers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              answerProvider.selectAnswer();
              _onAnswerSelected(index);
              _onTimerFinished();
            },
            child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                height: 37,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
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
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 15,0),
                      child: Text((index + 1).toString()),
                    ),
                    Expanded(
                      child: Text(answers[index].contenue),
                    ),
                    SizedBox(
                      width: 24, // Largeur fixe pour l'icône
                      child: ConditionalBuilder(
                        condition: answerProvider._isAnswerSelected || timeRemaining == 0,
                        builder: (context) {
                          // Vérifiez les conditions et renvoyez l'icône appropriée
                          if (answers[index].correct) {
                            return const Icon(Icons.check_circle, color: Colors.green); // Réponse correcte sélectionnée
                          } else if (!answers[index].correct && (selectedResponseIndex + 1) == answers[index].idReponse) {
                            return const Icon(Icons.cancel, color: Colors.red,); // Réponse incorrecte sélectionnée
                          } else {
                            return const SizedBox(); // Réponse incorrecte non sélectionnée (espace vide)
                          }
                        },
                        fallback: null,
                      ),
                    ),
                  ],
                )
            )
          );
        }
    );
  }
}

class AnswerProvider with ChangeNotifier {
  bool _isAnswerSelected = false;
  late int _score = 0;

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
