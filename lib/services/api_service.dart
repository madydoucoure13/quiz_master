import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class user {
  final int id;
  final String nomPrenom;
  // final String prenom;
  final String pseudo;
  // final int age;
  final String email;
  final String motDePasse;
  final String confirmPasseword;

  const user({
    required this.id,
    required this.nomPrenom,
    required this.pseudo,
    // required this.age,
    required this.email,
    required this.motDePasse,
    required this.confirmPasseword,
  });

  factory user.fromJson(Map<String, dynamic> json) {
    return user(
      id: json['idUtilisateur'],
      nomPrenom: json['nomPrenom'],
      pseudo: json['pseudo'],
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
  
  Future<Map<String, dynamic>> verifyUserEmail(
      String email) async {
    try {
      // Créez l'URI pour la vérification de l'utilisateur avec les paramètres dans l'URL (GET)
      var uri = Uri.parse(
          "http://10.0.2.2:8080/utilisateur/verifierUser?email=$email");
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
    pseudo: pseudo ?? '',
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
    // return utilisateur;
  } else {
    // Les données de l'utilisateur n'ont pas encore été stockées ou il y a une erreur.
    debugPrint(
        'Les données n\'ont pas été correctement stockées ou sont manquantes.');
  }
  return utilisateur;
}

// methode authentification google:::::::::::::::::::::::::::::
Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      debugPrint('user null');
      throw Error;
    }
  }

  