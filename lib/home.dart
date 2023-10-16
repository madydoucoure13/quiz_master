import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quiz_master/inscription.dart';
import 'package:quiz_master/login.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/home_header.png",
                  fit: BoxFit.cover,
                )
                //  Image(
                //   image: asset("assets/images/home_header.svg"),
                //   width: 396,
                //   height: 200,
                //
                // ),
                ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const login()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Connexion",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Inscription()));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Inscription",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: Color(0xFF0397CA),
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Bienvenue sur ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ]),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'QUIZZ MASTER !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF10B2E9),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Explorez, apprenez, triomphez c\'est \n",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          TextSpan(
                              text: " Quiz Master!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20)),
                        ])),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ListView(
                  children: [
                    Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    const ListTile(
                                      leading:
                                          Icon(Icons.account_circle_outlined),
                                      title: Text(
                                        'Sy DIAKARIDIA',
                                      ),
                                      subtitle: Text(
                                        'Crée le 10/10/2023',
                                      ),
                                      dense: false,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text("Catégorie: Informatique"),
                                          Text("Score: 1700")
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    const ListTile(
                                      leading:
                                          Icon(Icons.account_circle_outlined),
                                      title: Text(
                                        'Mady DOUCOURE',
                                      ),
                                      subtitle: Text(
                                        'Crée le 11/10/2023',
                                      ),
                                      dense: false,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text("Catégorie: Informatique"),
                                          Text("Score: 1700")
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading:
                                          Icon(Icons.account_circle_outlined),
                                      title: Text(
                                        'Mady DOUCOURE',
                                      ),
                                      subtitle: Text(
                                        'Crée le 11/10/2023',
                                      ),
                                      dense: false,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Catégorie: Informatique"),
                                          Text("Score: 1700")
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading:
                                          Icon(Icons.account_circle_outlined),
                                      title: Text(
                                        'Mady DOUCOURE',
                                      ),
                                      subtitle: Text(
                                        'Crée le 11/10/2023',
                                      ),
                                      dense: false,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Text("Catégorie: Informatique"),
                                          Text("Score: 1700")
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
