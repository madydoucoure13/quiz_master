import 'package:flutter/material.dart';

class PageAccueil extends StatelessWidget{
  const PageAccueil({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
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
      body: ListView(
        children: <Widget>[
          // barre info user
          ClipPath(
            clipper: Courbe(), // Utilisez votre classe CustomClipPath comme clipper
            child: Container(
              height: 80.0, // Ajustez la hauteur selon vos besoins
              color: Colors.blue, // Couleur de la barre info user
            ),
          ),
          //barre de recherche
          Padding(
            padding:const EdgeInsets.all(10.0),
             child: TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            border: OutlineInputBorder(borderRadius: 
            BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0.8),
            ),
            hintText: '   Faire des recherches...',
            suffixIcon: const Icon(Icons.search, size: 30.0,),
            )
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: DropdownMenuExample(),
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
    path.quadraticBezierTo(size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(3 / 4 * size.width, size.height+10, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    return path;
  }
    @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}




class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});
  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  static List<String> list = <String>['Culture générale', 'Informatique', 'Anglais', 'Biologie'];
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}