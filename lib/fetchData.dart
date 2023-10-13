import 'package:quiz_master/modeles/participer.dart';
import 'modeles/quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Quiz>> fetchQuiz() async {
  final response = await http.get(Uri.parse('http://localhost:9090/quiz/list'),
      headers: {"Access-Control-Allow-Origin": "*"});

  if (response.statusCode == 200) {
    // Si le serveur renvoie une réponse 200 OK, vous devez analyser une liste de quiz.
    final List<dynamic> quizJsonList = jsonDecode(response.body);
    final List<Quiz> quizzes =
        quizJsonList.map((quizJson) => Quiz.fromJson(quizJson)).toList();
    return quizzes;
  } else {
    // Si le serveur ne renvoie pas une réponse 200 OK, lancez une exception.
    throw Exception('Failed to load quizzes');
  }
}

void createParticiper(Participer participer) async {
  final response = await http.post(
      Uri.parse('http://localhost:9090/participer/ajouter'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic> {
        'level': participer.level,
        'id_quiz': participer.quizId,
        'score': participer.score,
        'terminer': participer.terminer,
        'id_utlisateur': participer.userId,
      }),
      );
      if(response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print('Create successfuly') ;
    } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create participation.');
    }

}
