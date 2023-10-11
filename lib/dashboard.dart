import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double _currentSliderValue = 0;

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
                            margin: EdgeInsets.only(top: 0, bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0XFFFFD700),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/play.png"),
                                Text(
                                  "Quiz",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 27, 0, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0397CA),
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10),
                                      ),
                                    ),
                                    width: double.infinity,
                                    child: Text(
                                      "Meilleur score 2000",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 120,
                            margin: EdgeInsets.only(bottom: 25),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0XFFFFD700),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0397CA),
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10),
                                      ),
                                    ),
                                    width: double.infinity,
                                    child: Text(
                                      "Quiz Total : 100",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 120,
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0XFFFFD700),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Image.asset("assets/icons/historique.png"),
                                ),
                                const Text(
                                  "Historique",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF0397CA),
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10),
                                      ),
                                    ),
                                    width: double.infinity,
                                    child: const Text(
                                      "Vous avez : +200",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    // Container pour les statistiques
                    Container(
                      width: 220,
                      height: 420,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Color(0xFFFFD700)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Statistiques',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          const Text(
                            'Programmation',
                            style: TextStyle(
                              color: Color(0xFF0297C9),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          SizedBox(height: 10), // Espace entre le texte et le cercle
                          CircularPercentIndicator(
                            radius: 65.0, // Taille du cercle
                            lineWidth: 10.0, // Largeur de la ligne du cercle
                            percent: 0.75, // Pourcentage à afficher (remplacez par votre propre pourcentage)
                            center: Text(
                              "75%", // Le texte du pourcentage
                              style: TextStyle(fontSize: 20),
                            ),
                            progressColor: Colors.blue, // Couleur de la partie remplie du cercle
                            backgroundColor: Colors.grey, // Couleur de la partie non remplie du cercle
                          ),
                          Text(
                            'Quiz accomplie',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Slider(
                            value: _currentSliderValue,
                            max: 100,
                            divisions: 5,
                            label: _currentSliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                              });
                            },
                          ),
                          Text(
                            'Réponses incorrectes',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Slider(
                            value: _currentSliderValue,
                            max: 100,
                            divisions: 5,
                            label: _currentSliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                              });
                            },
                          ),
                          Text(
                            'Réponses correctes',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Slider(
                            value: _currentSliderValue,
                            max: 100,
                            divisions: 5,
                            label: _currentSliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 34, 0, 0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF0397CA),
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(10),
                                ),
                              ),
                              width: double.infinity,
                              child: const Text(
                                "Score total 60%",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Container pour les quiz populaires
              Container(
                width: 355,
                height: 120,
                margin: EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Color(0xFFFFD700)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
