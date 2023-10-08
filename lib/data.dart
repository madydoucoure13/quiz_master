class Utilisateur {
  final int idUtilisateur;
  final String nom;
  final String prenom;
  final String email;
  final String motDePasse;

  Utilisateur({
    required this.idUtilisateur,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.motDePasse,
  });

  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
      idUtilisateur: json['idUtilisateur'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      motDePasse: json['motDePasse'],
    );
  }
}

class Question {
  final int idQuestion;
  final String contenue;

  Question({
    required this.idQuestion,
    required this.contenue,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      idQuestion: json['idQuestion'],
      contenue: json['contenue'],
    );
  }
}

class Quiz {
  final int idQuiz;
  final String titre;
  final int timer;
  final Utilisateur utilisateur;
  final List<Question> questions;

  Quiz({
    required this.idQuiz,
    required this.titre,
    required this.timer,
    required this.utilisateur,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    final utilisateur = Utilisateur.fromJson(json['utilisateur']);
    final questionsList = json['questions'] as List<dynamic>;
    final questions = questionsList.map((question) => Question.fromJson(question)).toList();

    return Quiz(
      idQuiz: json['idQuiz'] ?? 0,
      titre: json['titre'] ?? '',
      timer: json['timer'] ?? 0,
      utilisateur: utilisateur,
      questions: questions,
    );
  }
}
