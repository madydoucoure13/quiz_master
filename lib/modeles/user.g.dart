// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Utilisateur _$UtilisateurFromJson(Map<String, dynamic> json) => Utilisateur(
      json['idUtilisateur'] as int,
      json['nom'] as String? ?? '',
      json['prenom'] as String,
      json['email'] as String,
      json['motDePasse'] as String,
    );

Map<String, dynamic> _$UtilisateurToJson(Utilisateur instance) =>
    <String, dynamic>{
      'idUtilisateur': instance.idUtilisateur,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'email': instance.email,
      'motDePasse': instance.motDePasse,
    };
