// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      json['idQuestion'] as int? ?? 0,
      json['contenue'] as String? ?? '',
      (json['reponses'] as List<dynamic>)
          .map((e) => Reponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'idQuestion': instance.idQuestion,
      'contenue': instance.contenue,
      'reponses': instance.reponses,
    };
