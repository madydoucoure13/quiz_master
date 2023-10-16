// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      idQuiz: json['idQuiz'] as int? ?? 0,
      titre: json['titre'] as String? ?? '',
      timer: json['timer'] as int? ?? 15,
      utilisateur:
          Utilisateur.fromJson(json['utilisateur'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'idQuiz': instance.idQuiz,
      'titre': instance.titre,
      'timer': instance.timer,
      'utilisateur': instance.utilisateur.toJson(),
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };
