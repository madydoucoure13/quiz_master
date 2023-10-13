import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_master/quiz_create_state.dart';
import 'package:quiz_master/service/api_service.dart';
import 'package:quiz_master/service/quiz_create_service.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
TextEditingController quizNameController = TextEditingController();
TextEditingController questionTextController = TextEditingController();
TextEditingController reponseTextController1 = TextEditingController(); // Nommez les contrôleurs correctement
TextEditingController reponseTextController2 = TextEditingController();
TextEditingController reponseTextController3 = TextEditingController();
TextEditingController reponseTextController4 = TextEditingController();
TextEditingController responseTimeController = TextEditingController();
//TextEditingController timer = TextEditingController(); // Vous avez oublié d'ajouter ce contrôleur

const List<String> list = <String>[
  "Sélectionner une Catégorie",
  'Two',
  'Three',
  'Four',
];
// Déclarez la clé en dehors de la fonction build.
final _formKey = GlobalKey<FormState>();
List<QuestionData> quizQuestions = []; // Déclarez la liste de questions
class QuizCreate extends StatefulWidget {
  const QuizCreate({super.key});

  @override
  State<StatefulWidget> createState() => _QuizCreateState();
}

class _QuizCreateState extends State<QuizCreate> {
  String dropdownValue = list.first;
  final picker = ImagePicker();
  XFile? _image;
   
  int timer = 0;
  void changeTimer(int time) {
    setState(() {
      timer = time;
    });
  }

  Random random = Random();

void createQuiz() async{
  int idQuiz = random.nextInt(99999999);
  try {
      final response = await http.post(
      Uri.parse('http://10.175.48.139:8080/quiz/ajouter'),
      headers: <String, String> {
          'Content-Type' : 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': idQuiz,
        'titre' : quizNameController.text,
        'id_utilisateur': 1,
        'timer' : timer,
      }),
    );

    if(response.statusCode == 200) {
      print('success');
    }
  } catch (e) {
    print('Erreur lors de la requête : $e');
  }
  
}

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Create'),
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
                  child: Text('Modifier profile'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 3',
                  child: Text('Supprimer profil'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 4',
                  child: Text('À propos de nous'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 5',
                  child: Text("Partager l'appli"),
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: 90.0,
                    color: Colors.amber,
                  ),
                ),
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: 82.0,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20.0,
              left: 20.0,
              child: Container(
                decoration: BoxDecoration(),
                child: const Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
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
                    image: AssetImage("assets/images/profil.png"),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 100, left: 55, right: 55),
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(145, 145, 145, 145),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
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
                  ),
                ),
                // Autres widgets horizontaux ici
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 150, left: 40, right: 40),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Posez votre question en lui donnant un nom et un temps max de réponse en seconde',
                    style: TextStyle(fontSize: 14),
                  ),
                  Card(
                    elevation: 0,
                    color: Color.fromARGB(145, 145, 145, 145),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: quizNameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Nom de la Quiz',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Code à exécuter lorsque l'icône est cliquée
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            "Définir un temps de réponse"),
                                        content: Form(
                                          key: _formKey,
                                          child: TextFormField(
                                            controller: responseTimeController,
                                            decoration: const InputDecoration(
                                              hintText: 'Durée',
                                              hintStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Veuillez entrer une valeur.';
                                              }
                                              final numericValue =
                                                  int.tryParse(value);
                                              if (numericValue == null ||
                                                  numericValue > 10) {
                                                return 'La valeur doit être un nombre inférieur ou égal à 10.';
                                              }
                                              return null;
                                            },
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              changeTimer(int.tryParse(responseTimeController.text)!);
                                              print(int.tryParse(responseTimeController.text)!);
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            child: const Text("Valider"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.alarm,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.all(6.0),
                          child: TextField(
                            controller: questionTextController,
                            decoration: const InputDecoration(
                              hintText: 'La Question',
                              hintStyle: TextStyle(fontSize: 14),
                            ),
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: _getImage,
                                child: Text('Sélectionner une image'),
                              ),
                              SizedBox(width: 8),
                              _image != null
                                  ? Image.file(File(_image!.path),
                                      width: 50, height: 50)
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Faites vos propositions ici et indiquez la/les bonne(s) réponse(s)',
                    style: TextStyle(fontSize: 14),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        buildResponseCard(1, 'Votre Réponse 1'),
                        buildResponseCard(2, 'Votre Réponse 2'),
                        buildResponseCard(3, 'Votre Réponse 3'),
                        buildResponseCard(4, 'Votre Réponse 4'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: ()  {
                            createQuiz();
  // Construire l'objet QuestionData à partir des données du formulaire.
                                  // final apiService = ApiService();
                                  // final questionData = QuestionData(
                                  //   questionText: questionTextController.text,
                                  //   imagePath: _image?.path ?? '', // Le chemin de l'image sélectionnée
                                  //   responses: [
                                  //     reponseTextController1.text,
                                  //     reponseTextController2.text,
                                  //     reponseTextController3.text,
                                  //     reponseTextController4.text,
                                  //   ],
                                  // );

                                  // // Envoyer la question à l'API.
                                  // final response = await apiService.postQuestion(questionData);

                                  // // Gérer la réponse de l'API.
                                  // if (response.statusCode == 200) {
                                  //   // La question a été envoyée avec succès.
                                  // } else {
                                  //   // Une erreur s'est produite lors de l'envoi de la question.
                                  // }
                                },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            minimumSize: MaterialStateProperty.all<Size>(Size(
                                180,
                                40)), // Définir la largeur et la hauteur souhaitées
                          ),
                          child: const Text('Terminer'),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Logique à exécuter lorsque le deuxième bouton est pressé.
                            print("${quizNameController.text}  ${questionTextController.text}");
                            

                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.amber),
                            minimumSize: MaterialStateProperty.all<Size>(Size(
                                180,
                                40)), // Définir la largeur et la hauteur souhaitées
                          ),
                          child: const Text('Nouvelle question >'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildResponseCard(int value, String hintText) {
    return Card(
      elevation: 1,
      color: const Color.fromARGB(251, 249, 246, 246),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 14),
                  filled: true,
                  fillColor: const Color.fromARGB(145, 145, 145, 145),
                ),
                style: const TextStyle(fontSize: 14),
                //name: 'r',
              ),
            ),
            Radio(
              value: value,
              groupValue: 1,
              onChanged: (dynamic value) {
                // Ajoutez le code de gestion du changement de valeur ici
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
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

//================================================== instances create
      Future<void> _onSubmitQuiz() async {
        if (_formKey.currentState!.validate()) {
          final quizData = QuizData(
            quizName: quizNameController.text,
            responseTime: int.parse(responseTimeController.text),
            questions: quizQuestions,
          );

          // Ensuite, vous pouvez soumettre quizData à votre service de création de quiz.
          // Passez quizData à la méthode appropriée dans votre service.
          final quizService = QuizCreateService();
          final success = await quizService.submitData(quizData);

          if (success) {
            // Les données ont été soumises avec succès, effectuez des actions supplémentaires si nécessaire
            // Réinitialisez le formulaire, affichez un message de succès, etc.
            quizNameController.clear();
            responseTimeController.clear();
            quizQuestions.clear();
          }
        }
}
