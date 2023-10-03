import 'package:flutter/material.dart';

class ProfilUtilisateur extends StatelessWidget {
  const ProfilUtilisateur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Le premier container
          Container(
            height: 245,
            width: 500,
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(3, 151, 202, 1),
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
            height: 135,
            width: 250,
            margin: const EdgeInsets.only(top: 210, left: 60),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 232, 232),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 173, 216, 230),
                width: 2.0,
              ),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nom',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Prénom',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // UserProfile entre les deux conteneurs
          const Positioned(
            top: (10 - 60) / 2 + 180, // Position verticale pour le milieu
            left: (145 - 0) / 1, // Position horizontale pour le milieu
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/icons/sexe.png'),
            ),
          ),
          // Ligne Email
          Positioned(
            bottom: -100, // Position verticale en bas
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage('assets/icons/iconEmail.png'),
                    color: Colors.transparent,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'example@gmail.com',
                    style: TextStyle(
                      color: Colors.black, // Couleur du texte en noir
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  ImageIcon(
                    AssetImage('assets/icons/modifier.png'),
                    color: Colors.transparent,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
          // Ligne Pseudo
          Positioned(
            bottom: -145, // Position verticale en bas
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage('assets/icons/barbe.png'),
                    color: Colors.transparent,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Horen',
                    style: TextStyle(
                      color: Colors.black, // Couleur du texte en noir
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  ImageIcon(
                    AssetImage('assets/icons/modifier.png'),
                    color: Colors.transparent,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
          // Ligne Date
          Positioned(
            bottom: -190, // Position verticale en bas
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage('assets/icons/date.png'),
                    color: Colors.transparent,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '10/10/2009',
                    style: TextStyle(
                      color: Colors.black, // Couleur du texte en noir
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  ImageIcon(
                    AssetImage('assets/icons/modifier.png'),
                    color: Colors.transparent,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
          // Ligne Telephone
          Positioned(
            bottom: -235, // Position verticale en bas
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage('assets/icons/barbe.png'),
                    color: Colors.transparent,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'example@gmail.com',
                    style: TextStyle(
                      color: Colors.black, // Couleur du texte en noir
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  ImageIcon(
                    AssetImage('assets/icons/modifier.png'),
                    color: Colors.transparent,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
          // Ligne sexe
          Positioned(
            bottom: -280, // Position verticale en bas
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageIcon(
                    AssetImage('assets/icons/sexe.png'),
                    color: Colors.transparent,
                    size: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Homme',
                    style: TextStyle(
                      color: Colors.black, // Couleur du texte en noir
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  ImageIcon(
                    AssetImage('assets/icons/modifier.png'),
                    color: Colors.transparent,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
          //Les button
          Positioned(
            bottom: -450,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal:
                      65.0), // Ajustez l'espace horizontal entre les boutons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(
                          3, 151, 202, 1), // Couleur de fond du bouton
                      onPrimary: const Color.fromRGBO(
                          7, 10, 91, 1.0), // Couleur du texte du bouton
                      padding: const EdgeInsets.all(
                          16.0), // Espacement intérieur du bouton
                    ),
                    child: const Text(
                      'Changer compte',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(
                          255, 215, 0, 1.0), // Couleur de fond du bouton
                      onPrimary: const Color.fromRGBO(
                          7, 10, 91, 1.0), // Couleur du texte du bouton
                      padding: const EdgeInsets.all(
                          16.0), // Espacement intérieur du bouton
                    ),
                    child: const Text(
                      'Déconnexion',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
