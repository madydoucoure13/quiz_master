// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import 'modeles/question.dart';
// import 'modeles/quiz.dart';
//
// class Quiz extends StatefulWidget {
//   final Quiz quiz;
//
//   Quiz({required Key key, required this.quiz}) : super(key: key);
//
//   @override
//   _QuizState createState() => _QuizState();
// }
//
// class _QuizState extends State<Quiz> {
  int _currentQuestionIndex = 0;
  // int _timeRemaining = quiz.timer;
  bool _isAnswerSelected = false;
  bool _isButtonVisible = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }
//
//   @override
//   void dispose() {
//     _stopTimer();
//     super.dispose();
//   }
//
//   void _startTimer() {
//     _timer = Timer(Duration(seconds: _timeRemaining), () {
//       _onTimerFinished();
//     });
//   }
//
//   void _stopTimer() {
//     _timer?.cancel();
//   }
//
//   void _revealAnswer() {
//     final Question question = widget.quiz.questions[_currentQuestionIndex];
//     final Answer correctAnswer = question.answers.firstWhere((answer) =>
//     answer.correct);
//
//     for (int i = 0; i < question.answers.length; i++) {
//       final Answer answer = question.reponse[i];
//       if (answer == correctAnswer) {
//         answer.icon = Icons.check_circle;
//       } else {
//         answer.icon = Icons.close;
//       }
//     }
//     setState(() {});
//
//     Future.delayed(Duration(seconds: 3), () {
//       _currentQuestionIndex++;
//       _startTimer();
//     });
//   }
//
//
//   void _onTimerFinished() {
//     setState(() {
//       _timeRemaining = 0;
//       _isAnswerSelected = false;
//       _isButtonVisible = true;
//     });
//     _revealAnswer();
//   }
//
//   void _onAnswerSelected(int answerIndex) {
//     setState(() {
//       _isAnswerSelected = true;
//       _isButtonVisible = false;
//     });
//     _checkAnswer(answerIndex);
//   }
//
//   void _checkAnswer(int answerIndex) {
//     final Question question = widget.quiz.questions[_currentQuestionIndex];
//     final bool isCorrect = question.reponses[answerIndex].correct;
//
//     setState(() {
//       _isAnswerSelected = false;
//       _isButtonVisible = true;
//     });
//
//     if (isCorrect) {
//       _showSuccessIcon(answerIndex);
//     } else {
//       _showFailedIcon(answerIndex);
//     }
//   }
//
//   void _showSuccessIcon(int answerIndex) {
//     final Question question = widget.quiz.questions[_currentQuestionIndex];
//     question.reponses[answerIndex].icon = Icons.check_circle;
//     setState(() {});
//   }
//
//   void _showFailedIcon(int answerIndex) {
//     final Question question = widget.quiz.questions[_currentQuestionIndex];
//     question.reponses[answerIndex].icon = Icons.close;
//     setState(() {});
//   }
//
//   void _onSkipQuestion() {
//     setState(() {
//       _currentQuestionIndex++;
//       _isButtonVisible = true;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.quiz.titre),
//       ),
//       body: _buildBody(),
//     );
//   }
//
//   Widget _buildBody() {
//     if (_timeRemaining == 0) {
//       _revealAnswer();
//     }
//
//     return Column(
//       children: [
//         _buildQuestion(),
//         _buildAnswers(),
//         _buildButton(),
//       ],
//     );
//   }
//
//   Widget _buildQuestion() {
//     final Question question = widget.quiz.questions[_currentQuestionIndex];
//     return Text(question.contenue);
//   }
//
//   Widget _buildAnswers() {
//     final List<dynamic> answers = widget.quiz.questions[_currentQuestionIndex]
//         .reponses;
//     return ListView.builder(
//         itemCount: answers.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               _onAnswerSelected(index);
//             },
//             child: ListTile(
//               title: Text(answers[index].contenue),
//               trailing: Icon(answers[index].icon),
//             ),
//           );
//         }
//     );
//   }
// }