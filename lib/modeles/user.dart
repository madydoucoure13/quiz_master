import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class Utilisateur {
  int idUtilisateur;
  @JsonKey(defaultValue: '')
  String nom;
  String prenom;
  String email;
  String motDePasse;

  Utilisateur(
      this.idUtilisateur,
      this.nom,
      this.prenom,
      this.email,
      this.motDePasse,
      );

  factory Utilisateur.fromJson(Map<String, dynamic> json) =>
      _$UtilisateurFromJson(json);
  Map<String, dynamic> toJson() => _$UtilisateurToJson(this);

}