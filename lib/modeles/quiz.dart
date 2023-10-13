import 'package:json_annotation/json_annotation.dart';

import 'question.dart';
import 'user.dart';

part 'quiz.g.dart';

@JsonSerializable(explicitToJson: true)
class Quiz {
  @JsonKey(defaultValue: 0)
  int idQuiz;
  @JsonKey(defaultValue: '')
  String titre;
  @JsonKey(defaultValue: 15)
  int timer;
  Utilisateur utilisateur;
  List<Question> questions;

  Quiz(
      this.idQuiz,
      this.titre,
      this.timer,
      this.utilisateur,
      this.questions,
      );

  factory Quiz.fromJson(Map<String, dynamic> json) =>
      _$QuizFromJson(json);

  get score => null;
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}