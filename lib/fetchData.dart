import 'modeles/quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Quiz>> fetchQuiz() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8080/quiz/list'), headers: {"Access-Control-Allow-Origin": "*"});

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