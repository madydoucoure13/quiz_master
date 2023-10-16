import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_master/container/nav_bar_section.dart';
import 'package:quiz_master/historique.dart';
import 'package:quiz_master/mes_quiz.dart';
import 'package:quiz_master/quiz_populaire.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double _currentSliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/icons/quiz_master.png"),
        backgroundColor: const Color(0xFF10B2E9),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 10,
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(),
                            child: ClipPath(
                              clipper:
                                  Courbe(), // Utilisez votre classe CustomClipPath comme clipper
                              child: Container(
                                height:
                                    120.0, // Ajustez la hauteur selon vos besoins
                                color: const Color.fromARGB(255, 243, 201,
                                    33), // Couleur de la barre info user
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                            child: ClipPath(
                              clipper:
                                  Courbe(), // Utilisez votre classe CustomClipPath comme clipper
                              child: Container(
                                height:
                                    115.0, // Ajustez la hauteur selon vos besoins
                                color: const Color(
                                    0xFF10B2E9), // Couleur de la barre info user
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                const Expanded(
                                    flex: 7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Bienvenue sur la page d’accueil",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "SY Diakaridia",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            "https://i.imgur.com/BoN9kdC.png",
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
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
                            margin: const EdgeInsets.only(top: 0, bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0XFFFFD700),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/play.png"),
                                const Text(
                                  "Quiz",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 27, 0, 0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF0397CA),
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10),
                                      ),
                                    ),
                                    width: double.infinity,
                                    child: const Text(
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
                            margin: const EdgeInsets.only(bottom: 25),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0XFFFFD700),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child:
                                      Image.asset("assets/icons/mesquiz.png"),
                                ),
                                
                                /*
                                
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NavBarSection()));
                                
                                 */

                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Mesquiz())
                                    );
                                  },
                                  child: const Text(
                                    "Mes Quiz",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                
                                /*const Text(
                                  "Mes Quiz",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                */
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 25, 0, 0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF0397CA),
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10),
                                      ),
                                    ),
                                    width: double.infinity,
                                    child: const Text(
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
                                color: const Color(0XFFFFD700),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Image.asset(
                                      "assets/icons/historique.png"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Historique()));
                                  },
                                  child: const Text(
                                    "Historique",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                // const Text(
                                //   "Historique",
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 20,
                                //   ),
                                // ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 14, 0, 0),
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
                    const SizedBox(width: 10),
                    // Container pour les statistiques
                    Container(
                      width: 220,
                      height: 420,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1, color: const Color(0xFFFFD700)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          // const Text(
                          //   'Statistiques',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontSize: 15,
                          //     fontFamily: 'Inter',
                          //     fontWeight: FontWeight.w700,
                          //     height: 0,
                          //   ),
                          // ),

                          GestureDetector(
                            onTap: () {
                              // Utilisez la méthode Navigator.push() pour rediriger vers l'autre page avec un argument
                              // Navigator.pushNamed(
                              //   context, '/navBarSection',
                              // );

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NavBarSection()));
                            },
                            child: const Text(
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
                          const SizedBox(
                              height: 10), // Espace entre le texte et le cercle
                          CircularPercentIndicator(
                            radius: 65.0, // Taille du cercle
                            lineWidth: 10.0, // Largeur de la ligne du cercle
                            percent:
                                0.75, // Pourcentage à afficher (remplacez par votre propre pourcentage)
                            center: const Text(
                              "75%", // Le texte du pourcentage
                              style: TextStyle(fontSize: 20),
                            ),
                            progressColor: Colors
                                .blue, // Couleur de la partie remplie du cercle
                            backgroundColor: Colors
                                .grey, // Couleur de la partie non remplie du cercle
                          ),
                          const Text(
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
                          const Text(
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
                          const Text(
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
                margin: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: const Color(0xFFFFD700)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => QuizPopulaire())
                                );
                              },
                              child: const Text(
                                'Quiz Populaire ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                            

                            const Text(
                              'Spring Boot',
                              style: TextStyle(
                                color: Color(0xFF0297C9),
                                fontSize: 10,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            const SizedBox(
                                height:
                                    10), // Espace entre le texte et le cercle
                            CircularPercentIndicator(
                              radius: 65.0, // Taille du cercle
                              lineWidth: 10.0, // Largeur de la ligne du cercle
                              percent:
                                  0.75, // Pourcentage à afficher (remplacez par votre propre pourcentage)
                              center: const Text(
                                "75%", // Le texte du pourcentage
                                style: TextStyle(fontSize: 20),
                              ),
                              progressColor: Colors
                                  .blue, // Couleur de la partie remplie du cercle
                              backgroundColor: Colors
                                  .grey, // Couleur de la partie non remplie du cercle
                            ),
                          ],
                        ),
                        Column(
                          //Column bottom right
                          children: [
                            const Text(
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
                            const Text(
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
                          ],
                        ),
                      ],
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
      ),
    );
  }
}

class Courbe extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height + 10, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
