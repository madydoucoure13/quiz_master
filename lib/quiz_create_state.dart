import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_master/quiz_create.dart';
//import 'package:quiz_master/service/quiz_create_service.dart';

class _QuizCreateState extends State<QuizCreate> {
  TextEditingController quizNameController = TextEditingController();
  TextEditingController questionTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialisez vos contrôleurs ici ou effectuez d'autres opérations d'initialisation si nécessaire.
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // Reste du code de votre State

}
  
   //List<QuestionData> quizQuestions = [];

      Future<void> _getImage() async {
  var picker;
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  setState(() {
    var _image = pickedFile;
  });
}

void setState(Null Function() param0) {
}

