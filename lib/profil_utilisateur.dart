import 'package:flutter/material.dart';

import 'PageScore.dart';

class ProfilUtilisateur extends StatelessWidget {
  const ProfilUtilisateur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child:Stack(
        clipBehavior: Clip.none,
        children: [
          // Le premier container
          Container(
            height: 245,
            width: 500,
            margin: const EdgeInsets.only(top: 18, left: 20, right: 20),
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
            margin: const EdgeInsets.only(top: 180, left: 70),
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
            top: 140 - 0,
            left: 155,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/icons/sexe.png'),
            ),
          ),
          // Ligne Email
          Positioned(
            top: 300,
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(35.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 // ImageIcon(
                  //  AssetImage('assets/icons/iconEmail.png'),
                   // color: Colors.transparent,
                   // size: 25.0,
                  //),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/icons/em.png'),
                  ),
                  SizedBox(width: 0.0),
                  Text(
                    'example@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black, // Couleur du texte en noir
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(width: 0.0),
                    //AssetImage('assets/icons/modifier.png'),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/icons/modifier.png'),
                  )
                ],
              ),
            ),
          ),
          // Ligne Pseudo
          Positioned(
            top: 345,
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(35.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/icons/barbe.png'),
                  ),
                  Text(
                    'Horen',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black, // Couleur du texte en noir
                      fontSize: 20.0,
                    ),
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/icons/modifier.png'),
                  )
                ],
              ),
            ),
          ),
          // Ligne Date
          Positioned(
            top: 390, // Position verticale en bas
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(35.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/icons/date.png'),
                  ),
                  SizedBox(width: 0.0),
                  Text(
                    '10/10/2009',
                    style: TextStyle(
                      color: Colors.black, // Couleur du texte en noir
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(width: 0.0),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/icons/modifier.png'),
                  )
                ],
              ),
            ),
          ),
          // Ligne Telephone
          Positioned(
            top: 435, // Position verticale en bas
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(35.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/icons/tel.png'),
                  ),
                  SizedBox(width: 0.0),
                  Text(
                    '93080743',
                    style: TextStyle(
                      color: Colors.black, // Couleur du texte en noir
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(width: 0.0),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/icons/modifier.png'),
                  )
                ],
              ),
            ),
          ),
          // Ligne sexe
          Positioned(
            top: 480, // Position verticale en bas
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(35.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/icons/sexe.png'),
                  ),
                  SizedBox(width: 0.0),
                  Text(
                    'Homme',
                    style: TextStyle(
                      color: Colors.black, // Couleur du texte en noir
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(width: 0.0),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/icons/modifier.png'),
                  )
                ],
              ),
            ),
          ),
          //Les button
          Positioned(
            top: 600,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal:
                      40.0), // Ajustez l'espace horizontal entre les boutons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ConstrainedBox(
                  constraints: const BoxConstraints(
                  minWidth: 200,
              ),
                   child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(
                          3, 151, 202, 1), // Couleur de fond du bouton
                      onPrimary: const Color.fromRGBO(
                          7, 10, 91, 1.0), // Couleur du texte du bouton
                      padding: const EdgeInsets.all(
                          10.0), // Espacement intérieur du bouton
                    ),
                    child: const Text(
                      'Changer compte',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                    ),
                  ),
                    const SizedBox(width: 10),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 200,
                      ),
                   child: ElevatedButton(
                     //Chemein pour la page score
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute (builder: (context) => const PageScore()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(
                          255, 215, 0, 1.0),
                      onPrimary: const Color.fromRGBO(
                          7, 10, 91, 1.0),
                      padding: const EdgeInsets.all(
                          10.0),
                    ),
                    child: const Text(
                      'Déconnexion',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
