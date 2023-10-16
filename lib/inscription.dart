// import 'dart:ffi';

// import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:http/src/response.dart';
import 'package:quiz_master/main.dart';
// import 'package:quiz_master/models/dalog.dart';
import 'package:quiz_master/services/entete.dart';
import 'package:quiz_master/services/api_service.dart';

import 'package:quiz_master/dashboard.dart';

import 'modeles/navigation.dart';

// :::::::::::::::::::::::::::::::::::::  statfulwidget class :::::::::
class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _ageController = TextEditingController();
  Service service = Service();

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: const Color.fromARGB(244, 17, 131, 168),
        // title: const Text("Search"),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Container(
                // height: 100,
                decoration: const BoxDecoration(),
                width: double.infinity,
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: Colors.red)),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Stack(children: [
                    Positioned(
                      top: 3,
                      right: 5,
                      child: ClipPath(
                        clipper: NativeClipper(),
                        child: Container(
                          color: const Color.fromARGB(57, 158, 158, 158),
                          margin: const EdgeInsets.all(0),
                          height: 225,
                          width: 350,
                        ),
                      ),
                    ),
                    ClipPath(
                      clipper: NativeClipper(),
                      child: Container(
                        color: const Color.fromRGBO(16, 178, 233, 1.0),
                        margin: const EdgeInsets.all(0),
                        height: 220,
                        width: 350,
                      ),
                    ),
                    // Positioned(
                    //     top: 20,
                    //     right: 30,
                    //     child: Image.asset(
                    //       "assets/images/logo.png",
                    //       height: 190,
                    //       width: 360,
                    //     ))
                  ]),
                ]),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular((10.0))),
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(),

// ::::::::::::::::::contenaire des incrivez vous jus'au trait en haut des input:::::::::::::::
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: const TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: "Inscrivez-vous sur",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: " QUIZZ MASTER !",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber))
                                ]),
                              ),
                            ]),
                        // child: const Text('Inscription',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            height: 40,
                            width: 150,
                            child: const Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: FaIcon(
                                    FontAwesomeIcons.facebook,
                                    size: 22,
                                    // Icons.facebook,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Facebook",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            // color: const Color.fromARGB(255, 12, 12, 12),
                            height: 40,
                            width: 150,
                            child: const Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: FaIcon(
                                    size: 22,
                                    FontAwesomeIcons.google,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Google",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Ou remplissez la formulaire suivante',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: const BoxDecoration(
                                    //  color: Color.fromARGB(255, 255, 255, 255),
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Colors.grey))),
                                // height: 10,
                                width: 250,
                              )
                            ]),
                      ),
                      // :::::::::::::::::::::::formullaires::::::::::::::::::::::::::::::::::
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            // border: const EdgeInsets.all(context.)
                            children: [
                              // input nom &prenom:::::::::::::::::::::::::::::::
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: _nomController,
                                  decoration: const InputDecoration(
                                    labelText: "Nom & Prenom *",
                                    hintText: "Entree votre nom et Prenom",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.0))),
                                    contentPadding: EdgeInsets.all(8.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Ce champs est Obligatoir";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              // input pseudo::::::::::::::::::::::::::::::::
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: _pseudoController,
                                  decoration: const InputDecoration(
                                    labelText: "Pseudo *",
                                    hintText: "Entree votre Pseudonime",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.0))),
                                    contentPadding: EdgeInsets.all(8.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Ce champs est Obligatoir";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              // input mail::::::::::::::::::::::::::::::::::::::
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    labelText: "Email *",
                                    hintText: "Entree votre adresse mail",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.0))),
                                    contentPadding: EdgeInsets.all(8.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Ce champs est Obligatoir";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              // input password:::::::::::::::::::::::::::::::
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: passwordVisible,
                                  decoration: InputDecoration(
                                    labelText: "Password *",
                                    hintText: "Entree votre mot  de passe",
                                    suffixIcon: IconButton(
                                      icon: Icon(passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(
                                          () {
                                            passwordVisible = !passwordVisible;
                                          },
                                        );
                                      },
                                    ),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.0))),
                                    contentPadding: const EdgeInsets.all(8.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Ce champs et Obligatoir";
                                    }

                                    return null;
                                  },
                                ),
                              ),

                              // input password confirmer::::::::::::::::::::::::::::
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: _confirmpasswordController,
                                  obscureText: passwordVisible,
                                  decoration: InputDecoration(
                                    labelText: "Confirmer Password*",
                                    hintText: "Confirmer votre mot de passe",
                                    suffixIcon: IconButton(
                                      icon: Icon(passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(
                                          () {
                                            passwordVisible = !passwordVisible;
                                          },
                                        );
                                      },
                                    ),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.0))),
                                    contentPadding: EdgeInsets.all(8.0),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Ce champs est Obligatoir";
                                    }
                                    if (value != _passwordController.text) {
                                      return "mot de passe incorrect";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              // ::::::::::::::::::::::::::button de validation:::::::::::::::::::::::::::::
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formkey.currentState!.validate()) {
                                      try {
                                        // Appel de la méthode saveUser et attendre la réponse
                                        final response = await service.saveUser(
                                          _nomController.text,
                                          _pseudoController.text,
                                          _emailController.text,
                                          _passwordController.text,
                                          _confirmpasswordController.text,
                                        );

                                        // Vérification du code de statut HTTP de la réponse
                                        if (response.statusCode == 200) {
                                          debugPrint("response: ");
                                          // Succès : Utilisateur créé avec succès

                                          // Afficher un toast/modal de succès
                                          Fluttertoast.showToast(
                                            msg: "Utilisateur créé avec succès",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );

                                          // Rediriger l'utilisateur vers une autre page
                                          // ignore: use_build_context_synchronously
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NavBar(),
                                            ),
                                          );

                                          // ignore: use_build_context_synchronously
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                        } else {
                                          // Échec : Gérer l'erreur ici, par exemple afficher un toast/modal d'erreur
                                        }
                                      } catch (error) {
                                        // Gérer les erreurs générales ici, par exemple afficher un toast/modal d'erreur
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    // enabledMouseCursor: ,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                    // padding: const EdgeInsets.symmetric(
                                    //     horizontal: 2, vertical: 10),
                                  ),
                                  child: const Text('S’INSCRIRE',
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.amber)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // :::::::::::::::::::fin de formulaire:::::::::::::::::::::::::::::::::::::
                    ]),
              ),
            ],
          ),
        ),
      )),
    );
    // );
  }
}
