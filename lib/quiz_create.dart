import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

const List<String> list = <String>["Selectionner une Categorie", 'Two', 'Three', 'Four'];

class quiz_create extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _quiz_createState();
}

class _quiz_createState extends State<quiz_create> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Create'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Ajoutez ici la logique en fonction de l'élément sélectionné.
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Option 1',
                  child: Text('Voir profil'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 2',
                  child: Text('Modifier profil'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 3',
                  child: Text('Supprimer profil'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 4',
                  child: Text('A propos de nous'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 5',
                  child: Text('Partager l\'appli'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: Courbe(), // Utilisez votre classe CustomClipPath comme clipper
            child: Container(
              height: 100.0, // Ajustez la hauteur selon vos besoins
              color: Colors.amber, // Couleur de la première barre info user
            ),
          ),
          ClipPath(
            clipper: Courbe(), // Utilisez votre classe CustomClipPath comme clipper
            child: Container(
              height: 92.0, // Ajustez la hauteur selon vos besoins
              color: Colors.blue, // Couleur de la deuxième barre info user
            ),
          ),

          Container(
            margin: const EdgeInsets.only( top: 120, left: 30,right: 30),
            padding: const EdgeInsets.only(left :10,top:0, right:0, bottom: 0),
            width: double.infinity,
            decoration: BoxDecoration(
            color: const Color.fromARGB(145, 145, 145, 145),
              borderRadius: BorderRadius.circular(8)
            ),
            child:DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: list.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          )
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
    path.quadraticBezierTo(
      size.width / 4,
      size.height - 40,
      size.width / 2,
      size.height - 20,
    );
    path.quadraticBezierTo(
      3 / 4 * size.width,
      size.height + 10,
      size.width,
      size.height - 20,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
