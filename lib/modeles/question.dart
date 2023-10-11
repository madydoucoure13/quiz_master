import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_master/modeles/reponse.dart';

part 'question.g.dart';
@JsonSerializable()
class Question {
  @JsonKey(defaultValue: 0)
  int idQuestion;
  @JsonKey(defaultValue: '')
  String contenue;

  List<Reponse> reponses;

  Question(
      this.idQuestion,
      this.contenue,
      this.reponses
      );

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}