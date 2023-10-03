import 'package:flutter/material.dart';

class ProfilUtilisateur extends StatelessWidget {
  const ProfilUtilisateur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          // Le premier container
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
                color:
                    Color.fromARGB(255, 173, 216, 230), // Couleur bleue claire
                width: 2.0, // Largeur de la bordure
              ),
            ),
            child: const Text(''),
          ),
          // UserProfile entre les deux conteneurs
          const Positioned(
            top: (10 - 60) / 2 + 180, // Position verticale pour le milieu
            left: (150 - 0) / 1, // Position horizontale pour le milieu
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/icons/iconEmail.png'),
            ),
          ),
          // Conteneur avec icône, texte et icône en bas
          Positioned(
            bottom: 0.0, // Position verticale en bas
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Mon texte',
                    style: TextStyle(
                      color: Colors.black, // Couleur du texte en noir
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
