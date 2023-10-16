import 'package:flutter/material.dart';

import 'nav_bar_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter NavBar',
      home: NavBarSection(),
    );
  }
}
