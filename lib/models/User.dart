// ignore: file_names
class User {
  final String nomPrenom;
  // final String prenom;
  final String pesudo;
  // final int age;
  final String email;
  final String motDePasse;
  final String confirmPasseword;
  User({required this.nomPrenom, required this.pesudo,required this.email,required this.motDePasse,required this.confirmPasseword});
  factory User.fromJson(
    Map<String ,dynamic> json
  ){
    return User(confirmPasseword: json['confirmPasseword'],
     nomPrenom: json['nomPrenom'],
     pesudo: json['pesudo'],
     email: json['email'],
     motDePasse: json['motDePasse'],
    );
  }
}
