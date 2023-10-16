// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Utilisateur _$UtilisateurFromJson(Map<String, dynamic> json) => Utilisateur(
      idUtilisateur: json['idUtilisateur'] as int,
      nom: json['nom'] as String? ?? '',
      prenom: json['prenom'] as String,
      email: json['email'] as String,
      motDePasse: json['motDePasse'] as String,
    );

Map<String, dynamic> _$UtilisateurToJson(Utilisateur instance) =>
    <String, dynamic>{
      'idUtilisateur': instance.idUtilisateur,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'email': instance.email,
      'motDePasse': instance.motDePasse,
    };
