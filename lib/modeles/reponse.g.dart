// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reponse _$ReponseFromJson(Map<String, dynamic> json) => Reponse(
      json['idReponse'] as int,
      json['contenue'] as String? ?? '',
      json['correct'] as bool? ?? false,
    );

Map<String, dynamic> _$ReponseToJson(Reponse instance) => <String, dynamic>{
      'idReponse': instance.idReponse,
      'contenue': instance.contenue,
      'correct': instance.correct,
    };
