import 'package:flutter/material.dart';

class ProfilUtilisateur extends StatelessWidget {
  const ProfilUtilisateur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          // Le premier container
          Container(
            height: 200,
            width: 500,
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 135, 120, 231),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          // Le deuxième container
          Container(
            height: 100,
            width: 300,
            margin: const EdgeInsets.only(top: 150, left: 50),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 232, 232),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text('Mon nouveau container'),
          )
        ],
      ),
    );
  }
}
