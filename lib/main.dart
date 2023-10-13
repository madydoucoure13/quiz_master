import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/Provider/UtilisateurProvider.dart';
import 'package:quiz_master/login.dart';
import 'package:quiz_master/services/api_service.dart';
// import 'package:quiz_master/services/api_service.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/hom.dart';
// import 'package:quiz_master/dashboard.dart';


//import 'package:device_preview/device_preview.dart';
/*void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: ((context) => const MyApp()),
    ),
  );
}*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing the firebase app
  // await Firebase.initializeApp();
  //A ne pas effacer
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => UtilisateurProvider())
      ],
      child: const MyApp(),
    ),
  );
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
      Navigator.of(context as BuildContext)
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
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
