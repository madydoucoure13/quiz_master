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

// :::::::::::::::::::::::::::::::::::::  statfulwidget class :::::::::
class inscription extends StatefulWidget {
  const inscription({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<inscription> {
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _ageController = TextEditingController();
  Service service = Service();
  // Future<user>? _futureUser;

  String values = '';
  String? nom = '';

  String? prenom = '';
  String? tel = '';
  String? email = '';
  String? age = '';
  String? motDePasse = '';

  final _formkey = GlobalKey<FormState>();

  void submit(String b) {
    setState(() {
      values = 'Enregistrement effectuer avec succees $b';
    });
    // print(values);
  }

  // String values = '';
  void affiche(String a) {
    setState(() {
      values = 'Binvenue $a';
    });
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  bool _isTextFieldEmpty = false;
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            // border: const EdgeInsets.all(context.)
                            children: <Widget>[
                              Text(
                                values,
                                style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              // ::::::::::input nom:::::::
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: _isTextFieldEmpty
                                          ? Colors.red
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: _nomController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Entree votre nom ',
                                  ),

                                  onSaved: (newValue) {
                                    nom = newValue;
                                  },

                                  onChanged: affiche,
                                  onFieldSubmitted: submit,
                                  // obscureText: true,
                                ),
                              ),
                              // ::::::::::::::::::::::;input prenom:::::::::::::::::::
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: _isTextFieldEmpty
                                          ? Colors.red
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: _pseudoController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Entree votre  pseudo',
                                  ),

                                  onSaved: (newValue) {
                                    nom = newValue;
                                  },

                                  onChanged: affiche,
                                  onFieldSubmitted: submit,
                                  // obscureText: true,
                                ),
                              ),
                              // :::::::::input telephone::::::
                              // Container(
                              //   height: 50,
                              //   padding: const EdgeInsets.only(left: 10),
                              //   margin: const EdgeInsets.only(bottom: 10.0),
                              //   decoration: BoxDecoration(
                              //     border: Border.all(
                              //         width: 2,
                              //         color: _isTextFieldEmpty
                              //             ? Colors.red
                              //             : Colors.grey),
                              //     borderRadius: BorderRadius.circular(10),
                              //   ),
                              //   child: TextFormField(
                              //     controller: _telController,
                              //     keyboardType: TextInputType.number,
                              //     inputFormatters: [
                              //       FilteringTextInputFormatter.allow(
                              //           RegExp(r'[0-9]'))
                              //     ],
                              //     decoration: const InputDecoration(
                              //       border: InputBorder.none,
                              //       hintText:
                              //           'Entree votre numero de telephone',
                              //     ),
                              //     onChanged: (value) {
                              //       setState(() {
                              //         _isTextFieldEmpty = value.isEmpty;
                              //       });
                              //     },

                              //     validator: (value) {
                              //       if (value == null || value.isEmpty) {
                              //         _isTextFieldEmpty = true;
                              //         // return '';
                              //       }
                              //       return null;
                              //     },

                              //     onSaved: (newValue) {
                              //       tel = newValue;
                              //     },

                              //     // obscureText: true,
                              //   ),
                              // ),
                              // :::::::::::::input email::::::::::::::::
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: _isTextFieldEmpty
                                          ? Colors.red
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Entree votre adresse mail',
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _isTextFieldEmpty = value.isEmpty;
                                    });
                                  },

                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      _isTextFieldEmpty = true;
                                      // return '';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    email = newValue;
                                  },

                                  // obscureText: true,
                                ),
                              ),
                              // ::::::::::::::::::::::::::::::input password::::::::::::::::::::::::::::
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: _isTextFieldEmpty
                                          ? Colors.red
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: passwordVisible,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'password',
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
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _isTextFieldEmpty = value.isEmpty;
                                    });
                                  },

                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      _isTextFieldEmpty = true;
                                      // return '';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    motDePasse = newValue;
                                  },

                                  // obscureText: true,
                                ),
                              ),
                              // :::::::::::::::::::::::::::::::input confirm password:::::::::::::::::::::::::::::::::
                              Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 10),
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: _isTextFieldEmpty
                                          ? Colors.red
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: _confirmpasswordController,
                                  obscureText: passwordVisible,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'confirmer votre password',
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
                                      }, //color: Colors.green,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _isTextFieldEmpty = value.isEmpty;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      _isTextFieldEmpty = true;
                                      // return '';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    age = newValue;
                                  },
                                ),
                              ),
                              // ::::::::::::::::::::::::::button de validation:::::::::::::::::::::::::::::
                              ElevatedButton(
                                onPressed: () async {
                                  try {
                                    // Appel de la méthode saveUser et attendre la réponse
                                    final response = await service.saveUser(
                                      _nomController.text,
                                      _pseudoController.text,
                                      _emailController.text,
                                      _passwordController.text,
                                      _confirmpasswordController.text,
                                    );
                                    debugPrint("response: ${response.statusCode}");

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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MyHomePage(),
                                        ),
                                      );
                                    } else {
                                      // Échec : Gérer l'erreur ici, par exemple afficher un toast/modal d'erreur
                                      Fluttertoast.showToast(
                                        msg:
                                            "Erreur lors de la création de l'utilisateur",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor:
                                            Color.fromARGB(255, 6, 231, 6),
                                        fontSize: 16.0,
                                      );
                                    }
                                  } catch (error) {
                                    // Gérer les erreurs générales ici, par exemple afficher un toast/modal d'erreur
                                    Fluttertoast.showToast(
                                      msg: "Une erreur s'est produite : $error",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  }

                                  
                                },
                                // onPressed: validationForm,

                                style: ElevatedButton.styleFrom(
                                  // enabledMouseCursor: ,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 95, vertical: 10),
                                ),
                                child: const Text('S’INSCRIRE',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.amber)),
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
