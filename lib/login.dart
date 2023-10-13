import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:quiz_master/inscription.dart';
import 'package:quiz_master/main.dart';
import 'package:quiz_master/services/api_service.dart';
// import 'package:quiz_master/inscription.dart';
import 'package:quiz_master/services/entete.dart';
import 'package:google_sign_in/google_sign_in.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

//  final credential = GoogleAuthProvider.credential(idToken: idToken);
final _formkey = GlobalKey<FormState>();

class _loginState extends State<login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  ServiceLoger service = ServiceLoger();
  late Future<user> _futureUser;
  String values = '';
  String? email = '';
  String? nom = '';
  String? telephone = '';
  String? confirmPs = '';
  String? pasword = '';

  validationForm() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      debugPrint('$nom');
      debugPrint('$email');
      debugPrint('$telephone');
      debugPrint('$confirmPs');
      debugPrint('$confirmPs');
    } else {
      // if (_isTextFieldEmpty) {}
      debugPrint('Error......');
    }
  }

  void submit(String b) {
    setState(() {
      values = 'message envoiyer $b';
    });
    // print(values);
  }

  // String values = '';
  void affiche(String a) {
    setState(() {
      values = 'Binvenue $a';
    });
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    intializeFirebase();
  }

  Future<void> intializeFirebase() async {
    await Firebase.initializeApp();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        debugPrint('User is signed in!');
      }
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      debugPrint('user null');
      throw Error;
    }
  }

  // bool _isTextFieldEmpty = false;
  bool passwordVisible = false;
  Color maCouleur = const Color(0xFFFFD700);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,

      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 180,
        backgroundColor: const Color.fromARGB(252, 255, 255, 255),
        flexibleSpace: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              // border: Border.all(
              //     // color: const Color.fromRGBO(16, 178, 233, 1.0),
              //     )
              ),
          child: SafeArea(
            child: Stack(
                alignment: Alignment.topRight,
                // :::::::::::::::::::;entete logo:::::::::::::::::::::::::::;
                children: [
                  ClipPath(
                    clipper: NativeClipper(),
                    child: Container(
                      color: const Color.fromARGB(57, 158, 158, 158),
                      // margin: const EdgeInsets.only(top: 0),
                      padding: const EdgeInsets.only(left: 30),
                      height: 220,
                      width: 360,
                    ),
                  ),
                  ClipPath(
                    clipper: NativeClipper(),
                    child: Container(
                      color: const Color.fromRGBO(16, 178, 233, 1.0),
                      // margin: const EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.only(top: 30),
                      height: 170,
                      width: 350,
                    ),
                  ),
                  // Positioned(
                  //     top: 30,
                  //     right: 150,
                  //     child: Image.asset(
                  //       "assets/images/logo.png",
                  //       height: 150,
                  //       width: 150,
                  //     ))
                ]),
          ),
        ),
        // title: const Text("Settings"),
      ),
      // ::::::::::::::::::::::le body :::::::::::::::::::::::::::::::::::::
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RichText(
                text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Inscrivez-vous sur",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: " QUIZZ MASTER !",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber))
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ::::::::::::::::::la partie facebook::::::::::::::
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin:
                        const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    height: 40,
                    width: 150,
                    child: const Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FaIcon(
                            FontAwesomeIcons.facebook,
                            size: 22,
                            // Icons.facebook,
                          ),
                        ),
                        Center(
                          child: Text(
                            "Facebook",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // :::::la partie google:::::::
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                    height: 40,
                    width: 150,
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: FaIcon(
                            FontAwesomeIcons.google,
                            size: 22,
                            // Icons.facebook,
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              signInWithGoogle();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  Colors.black, // Couleur du texte du bouton
                            ),
                            child: const Text(
                              "Google",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('Ou vous connecter avec votre identifiant',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  Container(
                    width: 250,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                        //  color: Color.fromARGB(255, 255, 255, 255),
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                  ),
                ],
              ),
              // ::::::::formulaire::::::::::::::
              Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                            controller: _emailController,
                            // validator: MultiValidator([
                            //   RequiredValidator(
                            //       errorText: 'Enter email address'),
                            //   EmailValidator(
                            //       errorText: 'Please correct email filled'),
                            // ]),
                            decoration: const InputDecoration(
                                hintText: 'Email',
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email,
                                  //color: Colors.green,
                                ),
                                errorStyle: TextStyle(fontSize: 18.0),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(9.0))))),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                            controller: _passController,
                            obscureText: passwordVisible,
                            // validator: MultiValidator([
                            //   RequiredValidator(
                            //       errorText: 'Please enter Password'),
                            //   MinLengthValidator(8,
                            //       errorText: 'Password must be atlist 8 digit'),
                            //   PatternValidator(r'(?=.*?[#!@$%^&*-])',
                            //       errorText:
                            //           'Password must be atlist one special character')
                            // ]),
                            decoration: InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(
                                      () {
                                        passwordVisible = !passwordVisible;
                                      },
                                    );
                                  }, //color: Colors.green,
                                ),
                                errorStyle: const TextStyle(fontSize: 18.0),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(9.0))))),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // ::::::::::::::::::::::::::
                          TextButton(
                            child: const Text(
                              "Forget Password",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontFamily: "Dubai",
                                  fontSize: 14),
                            ),
                            onPressed: () {
                              //Get.to(ForgetPassword());
                            },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                            decoration: const BoxDecoration(),
                            child: ElevatedButton(
                              // onPressed: () {
                              //   setState(() {
                              //      service.verifyUser(_emailController.text,
                              //     _passController.text);
                              //   });
                              // },
                              onPressed: () async {
                                Map<String, dynamic>
                                user =
                                    await
                                     service.verifyUser(
                                        _emailController.text,
                                        _passController.text);
                                if (user["idUtilisateur"] != null &&
                                    user.containsKey("idUtilisateur")) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                }

                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 120, vertical: 10)),
                              child: Text(
                                'CONNEXION',
                                style:
                                    TextStyle(color: maCouleur, fontSize: 18),
                              ),
                            )),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Pas de compte ?',
                            style: TextStyle(fontSize: 14, fontFamily: 'Dubai'),
                          ),
                          TextButton(
                            child: const Text(
                              "En créer",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontFamily: "Dubai",
                                  fontSize: 14),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const inscription()),
                              );
                              // Get.to(ForgetPassword());
                            },
                          )
                        ],
                      ),

                      // TextFormField(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // ::::::::::::::::
      ),
      // resizeToAvoidBottomInset: false,
    );
  }
}
