// import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:quiz_master/inscription.dart';
import 'package:quiz_master/login.dart';
import 'package:quiz_master/services/api_service.dart';
// import 'package:quiz_master/services/api_service.dart';

// import 'services/api_service.dart';
// import 'package:quiz_master/services/api_service.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/hom.dart';
// import 'package:quiz_master/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  initializing the firebase app
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Master',
      theme: ThemeData(
          // primarySwatch: Colors.white,
          ),
      home: const login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  

  void _incrementCounter() {
    setState(() {
      _counter++;

    });
  }


  

  void sedeconnecte() async {
    await FirebaseAuth.instance.signOut();

    await GoogleSignIn().signOut().then((_) {
      // Exécute cette partie du code lorsque la déconnexion est réussie
      // Redirection vers la page de connexion
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Master"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
             ),
            // FutureBuilder(
            //     future: user,
            //     builder: ((context, snapshot) {
            //       return Text(snapshot.data?.nomPrenom);
            //     }))
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // sedeconnecte();
          localStorage();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.home),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
