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
          Padding(padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
            Container(
              decoration: const  BoxDecoration(),
              child: ClipPath(
            clipper: Courbe(), // Utilisez votre classe CustomClipPath comme clipper
            child: Container(
              height: 90.0, // Ajustez la hauteur selon vos besoins
              color: const Color.fromARGB(255, 243, 201, 33), // Couleur de la barre info user
            ),
          ),
            ),
            Container(
              decoration: const  BoxDecoration(),
              child: ClipPath(
            clipper: Courbe(), // Utilisez votre classe CustomClipPath comme clipper
            child: Container(
              height: 80.0, // Ajustez la hauteur selon vos besoins
              color: Colors.blue, // Couleur de la barre info user
            ),
          ),
            ),
    //Nom user
            Positioned(
              top: 20.0,
              left: 20.0,
              child:Container(
                decoration: const BoxDecoration(),
                child: const Text('Mamadou FADIGA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold

                ),
                ),
            )
              ),
     //pour la photo de profil     
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
                        "https://i.imgur.com/BoN9kdC.png",
                        ),
                    )
                  ),
                ),
               ),
          ]),
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
          Container( 
            margin: const EdgeInsets.only(bottom: 5),
            child:
          const Center(
            child: Text("CHOISIR UN QUIZ",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
           ) ,
          ),
  //Liste deroulante
          const Align(
            alignment:Alignment.centerRight,
          child:Padding(
            padding: EdgeInsets.only(right: 10),
            child:DropdownMenuExample(),
            ),
          ),
         const Methode(),
         const Methode(),
         const Methode(),
         const Methode(),
         const Methode(),

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
  static List<String> list = <String>['Toute categories','Culture générale', 'Informatique', 'Anglais', 'Biologie'];
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
// ignore: camel_case_types
class myDetaislContainer extends StatelessWidget{
  const myDetaislContainer({super.key});

  
  @override
  Widget build(BuildContext context){
    return const Column(
      children: [
        Padding(padding: EdgeInsets.only(left: 5),
          child: Text('Springboot',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),),
          ),
        Padding(padding: EdgeInsets.only(left: 5),
        child:
        Text('Catégorie: informatique',
        style: TextStyle(
          fontSize:15,
          color: Colors.black 
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left:5),
        child:
        Text('Créer par: Mamadou FADIGA',
        style: TextStyle(
          fontSize:15,
          color: Colors.black 
            ),
          ),
        ),
      ],
    );
  }
}
 
 class Methode extends StatelessWidget{
  const Methode({super.key});

  @override

  Widget build(BuildContext context) {
    return Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 12.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: const Color(0x802196F3),
                child:
                 Row(
                   children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 150,),
                      child:  const myDetaislContainer(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                    child:
                    SizedBox(
                      height: 100,
                      child: 
                      Positioned(
                        top: 10.0,
                        right: 100.0,
                        child: Container(
                        height: 70.0,
                        width: 70.0,
                        decoration: const BoxDecoration(
                           shape: BoxShape.circle,
                           image: DecorationImage(
                              fit: BoxFit.cover,
                             image: NetworkImage("https://i.imgur.com/BoN9kdC.png",),
                  )
                ),
              ),
               ),
                    ),
                    ),
                  ],
                ),
              ),
              ),
            ),
          );
  }
 }