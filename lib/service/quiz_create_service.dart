import 'package:http/http.dart' as http;

class QuizCreateService {
  final String apiUrl = 'http://localhost:8080'; //l'URL de l'API

  Future<bool> submitData(Map<String, dynamic> data) async {
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
}
