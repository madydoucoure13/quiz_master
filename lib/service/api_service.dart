import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String API_URL = 'https://example.com/api/';

  Future<http.Response> postQuestion(QuestionData questionData) async {
    final response = await http.post(
      Uri.parse('$API_URL/questions'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(questionData.toJson()),
    );

    return response;
  }
}
//===============================================class question data
class QuestionData {
  final String questionText;
  final String imagePath;
  final List<String> responses;

  QuestionData({
    required this.questionText,
    required this.imagePath,
    required this.responses,
  });

  Map<String, dynamic> toJson() => {
    'questionText': questionText,
    'imagePath': imagePath,
    'responses': responses,
  };
}
