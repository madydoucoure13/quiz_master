import 'package:flutter/material.dart';

class ProfilUtilisateur extends StatelessWidget {
  const ProfilUtilisateur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          // Le premier containerr
Container(
  height: 220,
  width: 500,
  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
  decoration: BoxDecoration(
    color: Color.fromRGBO(3, 151, 202, 1),
    borderRadius: BorderRadius.circular(20),
  ),
  child: Align(
    alignment: Alignment.topLeft, 
    child: IconButton(
      icon: const Icon(
        Icons.arrow_back, 
        color: Colors.white, 
      ),
      onPressed: () => Navigator.pop(context),
    ),
  ),
),
          // Le deuxième container
          Container(
  height: 100,
  width: 250,
  margin: const EdgeInsets.only(top: 180, left: 60),
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 236, 232, 232),
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Color.fromARGB(255, 173, 216, 230), // Couleur bleue claire
      width: 2.0, // Largeur de la bordure
    ),
  ),
  child: const Text('Mon nouveau container'),
),
// Cercle autour de l'icône
          // Positioned(
          //   bottom: 20, // Ajustez la position verticale selon vos besoins
          //   left: 60,
          //   top: 600, // Ajustez la position horizontale selon vos besoins
          //   child: Container(
          //     width: 120, // Largeur du cercle
          //     height: 120, // Hauteur du cercle
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.blue, // Couleur du cercle
          //     ),
          //     child: Center(
          //       child: Image.asset(
          //         'assets/icons/iconEmail.png', // Chemin vers l'image
          //         width: 80, // Largeur de l'icône
          //         height: 80, // Hauteur de l'icône
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
