import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_master/JouerPage.dart';
import 'modeles/quiz.dart';



Future<List<Quiz>> fetchQuiz() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/quiz/list'));
    // final response = await http.get(Uri.parse('http://10.175.48.41:8080/quiz/list'));


if (response.statusCode == 200) {
   print('-------------OKKKKKK---------');
    // Si le serveur renvoie une réponse 200 OK, vous devez analyser une liste de quiz.
    final List<dynamic> quizJsonList = jsonDecode(response.body);
    final List<Quiz> quizzes = quizJsonList.map((quizJson) => Quiz.fromJson(quizJson)).toList();
    return quizzes;
  } else {
    // Si le serveur ne renvoie pas une réponse 200 OK, lancez une exception.
    throw Exception('Failed to load quizzes');
  }
}

class QuizPopulaire extends StatefulWidget {
  const QuizPopulaire({Key? key}) : super(key: key);

  
    @override
  _QuizPopulaireState createState() => _QuizPopulaireState();
}

class _QuizPopulaireState extends State<QuizPopulaire>{
  late Future<List<Quiz>> quizList;

  //  @override
  // void initState() {
  //   list();
  //   super.initState();
  //   quizList = fetchQuiz();
  // }

  // void list() async {
  //   try {
  //     final List<Quiz> quizList = await fetchQuiz();
  //     // Maintenant, vous avez une liste d'objets Quiz prêts à être utilisés.
  //     // Vous pouvez les afficher, les traiter, etc.
  //     for (final quiz in quizList) {
  //       print('ID: ${quiz.idQuiz}');

  //       print('Titre: ${quiz.titre}');
  //       print('Timer: ${quiz.timer}');
  //       print('Utilisateur: ${quiz.utilisateur.nom} ${quiz.utilisateur.prenom}');
  //       print('Questions:');
  //       for (final question in quiz.questions) {
  //         print('  Question ID: ${question.idQuestion}');
  //         print('  Contenu: ${question.contenue}');
  //       }
  //       print('----------------------');
  //     }
  //   } catch (e) {
  //     print('Une erreur s\'est produite lors de la récupération des quiz : $e');
  //   }
  // }

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
      body: Column(
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
            child: Text("LISTE DES QUIZ POPULAIRES",
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
        //appeler le fiture builder ici>
        FutureBuilder<List<Quiz>>(
          // future: quizList,
          future: fetchQuiz(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
          // En cours de chargement, vous pouvez afficher un indicateur de chargement ici.
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // En cas d'erreur, vous pouvez afficher un message d'erreur ici.
          return Text('Error: ${snapshot.error}');
        } else {
          // Lorsque les données sont prêtes, affichez-les.
          final quizzes = snapshot.data ?? [];
          return Expanded(
            child: 
          ListView.builder(
            itemCount: quizzes.length,
            itemBuilder: (BuildContext context, int index) {
              final quiz = quizzes[index];
              return myDetaislContainer(quiz:quiz);
                // Ajoutez ici d'autres éléments d'affichage ou de traitement en fonction de vos besoins.

            },
          )
          );
        }
          }
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
class myDetaislContainer extends StatefulWidget{
  final Quiz quiz;

  const myDetaislContainer({required this.quiz, Key? key}) : super(key: key);

  
  @override
  _MyDetailContainerState createState() => _MyDetailContainerState ();
}

  class _MyDetailContainerState extends State<myDetaislContainer> {

  late Future<List<Quiz>> quizList;
  

  @override
  void initState() {
    super.initState();
    quizList = fetchQuiz();
  }


     @override
  Widget build(BuildContext context) {
    final quiz = widget.quiz; // Accédez au quiz à partir des propriétés du widget

    return GestureDetector(
      onTap: () => {
        Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JouerPage(),
      ),
        )
      },
      child: 
      Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            quiz.titre, // Utilisez le titre du quiz à partir de l'objet quiz
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'Catégorie: ${quiz.titre}', // Utilisez la catégorie du quiz
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'Créé par: ${quiz.utilisateur}', // Utilisez le nom du créateur du quiz
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
      ],
      )
      );
  }
  }
 
 
