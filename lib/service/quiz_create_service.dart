import 'package:http/http.dart' as http;
import 'package:quiz_master/main.dart';

class QuizCreateService {
  final String apiUrl = 'http://localhost:8080'; //l'URL de l'API

  Future<bool> submitData(QuizData data) async {
    final response = await http.post(
      Uri.parse('$apiUrl/quiz/ajouter'), // l'endpoint de connexion
      body: data,
    );

    if (response.statusCode == 200) {
      // Le serveur a répondu avec succès
      return true;
    } else {
      // Gérer les erreurs ici, par exemple, afficher un message d'erreur à l'utilisateur
      print('Erreur lors de la soumission des données : ${response.statusCode}');
      return false;
    }
  }

  createQuiz(QuizData quizData) {

  }
}

//============================================================ models

class QuizData {
  String quizName;
  int responseTime;
  
  var questions;
  //List<QuestionData> questions;

  QuizData({required this.quizName, required this.responseTime, required this.questions});
}

// class QuestionData {
//   String questionText;
//   String imagePath;
//   List<String> responses;

//   QuestionData({required this.questionText, required this.imagePath, required this.responses});

//   Object? toJson() {}
// }
