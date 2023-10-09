import 'package:json_annotation/json_annotation.dart';

part 'reponse.g.dart';

@JsonSerializable()
class Reponse {
  int idReponse;
  @JsonKey(defaultValue: '')
  String contenue;
  @JsonKey(defaultValue: false)
  bool correct;

  Reponse(
      this.idReponse,
      this.contenue,
      this.correct
      );

  factory Reponse.fromJson(Map<String, dynamic> json) =>
      _$ReponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReponseToJson(this);
}