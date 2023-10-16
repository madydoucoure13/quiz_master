import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/login.dart';
import 'package:quiz_master/mes_quiz.dart';
import 'package:quiz_master/quiz_populaire.dart';
import 'package:quiz_master/page_accueil.dart';
import 'package:quiz_master/quiz_create.dart';
import 'package:quiz_master/home.dart';
import 'package:quiz_master/JouerPage.dart';
import 'fetchData.dart';
import 'modeles/quiz.dart';
import 'modeles/navigation.dart';
import 'package:quiz_master/dashboard.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AnswerProvider(),
    child: const Quiz(),
  ));
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz Master',
      debugShowCheckedModeBanner: false,
      //home: PageAccueil(),
      // home: QuizPopulaire(),
      // home: NavBar(),
      // home: login(),
      // home: HomeWidget(),
      // home: Dashboard(),
      // home: JouerPage(),
      // home: QuizCreate(),
      // home: NavBarSection(),
    );
  }
}
