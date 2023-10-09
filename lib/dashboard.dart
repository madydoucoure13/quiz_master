import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: ClipRRect(
                    // borderRadius: BorderRadius.
                    child: Image.asset("assets/images/home_header.png",
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0XFFFFD700)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/play.png"),
                              Text(
                                "Quiz",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 27, 0, 0),
                                child: Container(
                                  //margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF0397CA),
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10))),
                                  width: double.infinity,
                                  child: Text("Meilleur score 2000",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 120,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0XFFFFD700)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Image.asset("assets/icons/mesquiz.png"),
                              ),
                              const Text(
                                "Mes Quiz",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                                child: Container(
                                  //margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF0397CA),
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10))),
                                  width: double.infinity,
                                  child: Text("Quiz Total : 100",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 120,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0XFFFFD700)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child:
                                    Image.asset("assets/icons/historique.png"),
                              ),
                              const Text(
                                "Historique",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                                child: Container(
                                  //margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF0397CA),
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10))),
                                  width: double.infinity,
                                  child: const Text("Vous avez : +200",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        Container(
                          //height: double.infinity,
                          color: Colors.blue[500],
                          child: Center(child: Text("Bonjour")),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3, // 30%
                  child: Container(
                    color: Colors.red,
                    child: Text("Bonjour"),
                  ),
                ),
                Expanded(
                  flex: 7, // 70%
                  child: Container(
                    color: Colors.green,
                    child: Text("Bonjour"),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
