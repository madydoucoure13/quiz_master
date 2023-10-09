import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';
@JsonSerializable()
class Question {
  @JsonKey(defaultValue: 0)
  int idQuestion;
  @JsonKey(defaultValue: '')
  String contenue;

  Question(
      this.idQuestion,
      this.contenue,
      );

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}