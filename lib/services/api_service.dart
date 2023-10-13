import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class user {
  final int id;
  final String nomPrenom;
  // final String prenom;
  final String pesudo;
  // final int age;
  final String email;
  final String motDePasse;
  final String confirmPasseword;

  const user({
    required this.id,
    required this.nomPrenom,
    required this.pesudo,
    // required this.age,
    required this.email,
    required this.motDePasse,
    required this.confirmPasseword,
  });

  factory user.fromJson(Map<String, dynamic> json) {
    return user(
      id: json['idUtilisateur'],
      nomPrenom: json['nomPrenom'],
      pesudo: json['pesudo'],
      // tel: json['tel'],
      // age: json['age'],
      email: json['email'],
      motDePasse: json['motDePasse'],
      confirmPasseword: json['confirmPasseword'],
    );
  }
}

// :::::::::::::::::::::;methode get::::::::::::::::::::
Future<user> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8080/utilisateur/read'));
  debugPrint("ertyu");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> rty = jsonDecode(response.body);
    List<user> users = rty.map((dynamic e) => user.fromJson(e)).toList();
    return users.first;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// :::::::::::::::::::::::::::::::::::methode post::::::::::::::::::::::::::::

class Service {
  Future<http.Response> saveUser(
    String nomPrenom,
    // String prenom,
    String pseudo,
    // int age,
    String email,
    String motDePasse,
    String confirmPasseword,
  ) async {
    try {
      // Créez l'URI
      var uri = Uri.parse("http://10.0.2.2:8080/utilisateur/ajouter");

      // En-têtes
      Map<String, String> headers = {"Content-Type": "application/json"};

      // Corps de la requête
      Map data = {
        'nomPrenom': nomPrenom,
        // 'prenom': prenom,
        'pseudo': pseudo,
        // 'age': age,
        'email': email,
        'motDePasse': motDePasse,
        'confirmPasseword': confirmPasseword,
      };

      // Convertit les données en JSON
      var body = json.encode(data);

      // Envoie la requête POST
      var response = await http.post(uri, headers: headers, body: body);
      debugPrint("je suis");
      debugPrint(body);

      // Vérifie le code de statut de la réponse
      if (response.statusCode == 200) {
        // Succès : Utilisateur créé avec succès
// Stockez les données de l'utilisateur dans SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('nomPrenom', nomPrenom);
        await prefs.setString('pseudo', pseudo);
        await prefs.setString('email', email);
        await prefs.setString('motDePasse', motDePasse);
        await prefs.setString('confirmPasseword', confirmPasseword);

        return response;
      } else {
        // Échec : Gestion d'erreur en cas de code de statut non attendu
        throw Exception(
            'Erreur lors de la création de l\'utilisateur. Code de statut : ${response.statusCode}');
      }
    } catch (error) {
      // Gestion des erreurs générales (par exemple, perte de connexion)
      throw Exception('Une erreur s\'est produite : $error');
    }
  }
}
// :::::::::::::::::::::::::::login:::::::::::::

class ServiceLoger {
  Future<Map<String, dynamic>> verifyUser(
      String email, String motDePasse) async {
    try {
      // Créez l'URI pour la vérification de l'utilisateur avec les paramètres dans l'URL (GET)
      var uri = Uri.parse(
          "http://10.0.2.2:8080/utilisateur/connexion?email=$email&mot_de_passe=$motDePasse");
      debugPrint("$uri");
      // Envoie la requête GET
      var response = await http.post(uri);

      // Vérifie le code de statut de la réponse
      if (response.statusCode == 200) {
        debugPrint("${response.statusCode}");
        debugPrint(response.body);
        // Succès : Utilisateur existe et informations correctes
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        debugPrint(" existe et informations correctes");
        // Échec : Utilisateur existe, mais informations incorrectes
        return Map();
      } else {
        // Autres cas de code de statut (gestion d'erreur)
        throw Exception(
            'Erreur lors de la vérification de l\'utilisateur. Code de statut : ${response.body}');
      }
    } catch (error) {
      // Gestion des erreurs générales (par exemple, perte de connexion)
      throw Exception('Une erreur s\'est produite : $error');
    }
  }
}

Future<user> localStorage() async {
  final prefs = await SharedPreferences.getInstance();
  var nomPrenom = prefs.getString('nomPrenom');
  var pseudo = prefs.getString('pseudo');
  var email = prefs.getString('email');
  var motDePasse = prefs.getString('motDePasse');
  var confirmPasseword = prefs.getString('confirmPasseword');

  user utilisateur = user(
    id: 0,
    nomPrenom: nomPrenom ?? '',
    pesudo: pseudo ?? '',
    email: email ?? '',
    motDePasse: motDePasse ?? '',
    confirmPasseword: confirmPasseword ?? '',
  );
  if (nomPrenom != null &&
      pseudo != null &&
      email != null &&
      motDePasse != null &&
      confirmPasseword != null) {
    // Les données ont été correctement stockées
    debugPrint('Données stockées avec succès :');
    debugPrint('Nom et Prénom : $nomPrenom');
    debugPrint('Pseudo : $pseudo');
    debugPrint('Email : $email');
    debugPrint('Mot de passe : $motDePasse');
    debugPrint('Confirmation du mot de passe : $confirmPasseword');
  } else {
    // Les données de l'utilisateur n'ont pas encore été stockées ou il y a une erreur.
    debugPrint(
        'Les données n\'ont pas été correctement stockées ou sont manquantes.');
  }
  return utilisateur;
}








// class ServiceLoger {
//   Future<user> verifyUser(String email, String motDePasse) async {
//     try {
//       // Créez l'URI pour la vérification de l'utilisateur
//       var uri = Uri.parse("http://10.0.2.2:8080/utilisateur/connexion");

//       // // En-têtes
//       // Map<String, String> headers = {"Content-Type": "application/json"};

//       // // Corps de la requête
//       // Map data = {
//       //   'email': email,
//       //   'motDePasse': motDePasse,
//       // };

//       // Convertit les données en JSON
//       var body = json.encode(data);

//       // Envoie la requête POST
//       var response = await http.post(uri, headers: headers, body: body);

//       // Vérifie le code de statut de la réponse
//       if (response.statusCode == 200) {
//         // Succès : Utilisateur existe et informations correctes
//         return json.decode(response.body);
//       } else if (response.statusCode == 401) {
//         // Échec : Utilisateur existe, mais informations incorrectes
//          return user.fromJson(json.decode(response.body));
//       } else {
//         // Autres cas de code de statut (gestion d'erreur)
//         throw Exception('Erreur lors de la vérification de l\'utilisateur. Code de statut : ${response.body}');
//       }
//     } catch (error) {
//       // Gestion des erreurs générales (par exemple, perte de connexion)
//       throw Exception('Une erreur s\'est produite : $error');
//     }
//   }
// }

 
//  Future<bool> alertDialog( BuildContext context) {
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Done'),
//           content: Text('Add Success'),
//           actions: <Widget>[
//             FlatButton(
//               child: Text('Ok'),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       });
// }

// class _inscrisState extends State<test> {
//   final TextEditingController _controller = TextEditingController();
//   Future<user>? _futureuser;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Create Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Create Data Example'),
//         ),
//         body: Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.all(8),
//           child: (_futureuser == null) ? buildColumn() : buildFutureBuilder(),
//         ),
//       ),
//     );
//   }

//   Column buildColumn() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         TextField(
//           controller: _controller,
//           decoration: const InputDecoration(hintText: 'Enter Title'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _futureuser = saveUser(_controller.text);
//             });
//           },
//           child: const Text('Create Data'),
//         ),
//       ],
//     );
//   }

//   FutureBuilder<user> buildFutureBuilder() {
//     return FutureBuilder<user>(
//       future: _futureuser,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Text(snapshot.data!.nom);
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }

//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }
// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

// class MyApi extends StatefulWidget {
//   const MyApi({super.key});

//   @override
//   State<MyApi> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApi> {
//   late Future<user> futureUser;

//   @override
//   void initState() {
//     super.initState();
//     futureUser = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<user>(
//             future: futureUser,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data!.nom);
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
