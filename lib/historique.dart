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
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: ClipPath(
                    clipper: Courbe(), // Utilisez votre classe CustomClipPath comme clipper
                    child: Container(
                      height: 90.0, // Ajustez la hauteur selon vos besoins
                      color: const Color.fromARGB(255, 243, 201, 33), // Couleur de la barre info user
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: ClipPath(
                    clipper: Courbe(), // Utilisez votre classe CustomClipPath comme clipper
                    child: Container(
                      height: 80.0, // Ajustez la hauteur selon vos besoins
                      color: Colors.blue, // Couleur de la barre info user
                    ),
                  ),
                ),
                // Nom user
                Positioned(
                  top: 20.0,
                  left: 20.0,
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: const Text(
                      'Aichata DICKO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Pour la photo de profil
                Positioned(
                  top: 10.0,
                  right: 20.0,
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrYQPfbCGTgEzc3N-aUx8nkhv61Q-2W133EkPiGFlcKI3Cm5nNtw5YoromXsIqgC6pRPk&usqp=CAU.jpg",
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
                        padding: const EdgeInsets.all(6.0), // Espacement autour de l'icône réduite
                        decoration: const BoxDecoration(
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
                                      child: const Text(
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

class Courbe extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(3 / 4 * size.width, size.height+10, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
