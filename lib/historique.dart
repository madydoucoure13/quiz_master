import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Historique(),
    );
  }
}

class QuizItem {
  final String name;
  final String category;
  final String playerName;

  QuizItem(this.name, this.category, this.playerName);
}

class Historique extends StatefulWidget {
  @override
  _HistoriqueState createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  final List<QuizItem> quizItems = [
    QuizItem("Quiz 1", "Catégorie A", "Joueur 1"),
    QuizItem("Quiz 2", "Catégorie B", "Joueur 2"),
    // Ajoutez d'autres éléments ici
  ];
  int selectedItemIndex =
      -1; // Index de l'élément sélectionné (-1 signifie aucun élément sélectionné)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Historique',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); // Action du bouton retour
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white, // Couleur blanche de l'icône
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Action lorsque vous appuyez sur le bouton avec l'icône de multiplication
            },
            icon: Icon(
              Icons.clear,
              color: Colors.red, // Couleur rouge de l'icône
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              children: [
                ClipPath(
                  clipper: MySecondCustomClipper(),
                  child: Container(
                    height: 150.0,
                    color: Colors.yellow, // Couleur jaune de l'arrière-plan
                  ),
                ),
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: 149.8,
                    color: Colors.blue, // Couleur bleue de l'arrière-plan
                    child: Center(
                      child: Text(
                        'SY Diakaridia',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.0, // Taille de police agrandie
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Historiques',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      // Action pour vider tout
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                      size: 24.0,
                    ),
                    label: Text(
                      'Vider tout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final item = quizItems[index];

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedItemIndex = index; // Met à jour l'élément sélectionné
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0), // Espacement autour de l'élément
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 5.0,
                          color: (index == 0) // Jaune pour le premier élément
                              ? Colors.yellow
                              : (index == 1) // Bleu pour le deuxième élément
                                  ? Colors.blue
                                  : Colors.transparent, // Sinon, transparente
                        ),
                        top: BorderSide(
                          width: 2.0,
                          color: index == selectedItemIndex ? Colors.blue : Colors.transparent, // Bordure bleue pour l'élément sélectionné, sinon transparente
                        ),
                        right: BorderSide(
                          width: 2.0,
                          color: index == selectedItemIndex ? Colors.blue : Colors.transparent, // Bordure bleue pour l'élément sélectionné, sinon transparente
                        ),
                        bottom: BorderSide(
                          width: 2.0,
                          color: index == selectedItemIndex ? Colors.blue : Colors.transparent, // Bordure bleue pour l'élément sélectionné, sinon transparente
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        item.name,
                        style: TextStyle(
                          color: index == selectedItemIndex ? Colors.blue : Colors.black, // Texte bleu pour l'élément sélectionné, sinon noir
                        ),
                      ),
                      subtitle: Text('Catégorie: ${item.category}\nJoueur: ${item.playerName}'),
                      trailing: Container(
                        padding: EdgeInsets.all(6.0), // Espacement autour de l'icône réduite
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red, // Couleur de fond rouge
                        ),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Confirmation'),
                                  content: Text('Voulez-vous supprimer ce quiz ?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Ferme la boîte de dialogue
                                      },
                                      child: Text(
                                        'Non',
                                        style: TextStyle(
                                          color: Colors
                                              .white, // Couleur du texte en blanc
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue), // Fond bleu
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          quizItems.removeAt(
                                              index); // Supprime l'élément de la liste
                                          selectedItemIndex =
                                              -1; // Réinitialise l'élément sélectionné
                                        });
                                        Navigator.of(context)
                                            .pop(); // Ferme la boîte de dialogue
                                      },
                                      child: Text(
                                        'Oui',
                                        style: TextStyle(
                                          color: Colors
                                              .white, // Couleur du texte en blanc
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.red), // Fond rouge
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white, // Couleur de l'icône en blanc
                            size: 18.0, // Taille de l'icône réduite
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: quizItems.length,
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height * 0.5) // Déplacez-vous au point de départ en bas au milieu
      ..quadraticBezierTo(size.width * 0.25, 0, size.width * 0.5, size.height * 0.5) // Courbe de Bézier quadratique
      ..quadraticBezierTo(size.width * 0.75, size.height, size.width, size.height * 0.5) // Courbe de Bézier quadratique
      ..lineTo(size.width, 0) // Ligne droite jusqu'en haut
      ..lineTo(0, 0) // Ligne droite jusqu'au point de départ
      ..close(); // Fermez le chemin pour former une forme fermée

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MySecondCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height * 0.6) // Déplacez-vous au point de départ en bas au milieu
      ..quadraticBezierTo(size.width * 0.25, 0, size.width * 0.5, size.height * 0.6) // Courbe de Bézier quadratique
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.9, size.width, size.height * 0.7) // Courbe de Bézier quadratique
      ..lineTo(size.width, 0) // Ligne droite jusqu'en haut
      ..lineTo(0, 0) // Ligne droite jusqu'au point de départ
      ..close(); // Fermez le chemin pour former une forme fermée

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
