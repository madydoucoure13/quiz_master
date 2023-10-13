//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:quiz_master/container/navbar.dart';

import 'container/nav_bar_section.dart';

import 'package:device_preview/device_preview.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'JouerPage.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const Quiz(),
  ));
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // title: 'Quiz Master',
      debugShowCheckedModeBanner: false,
      home: const NavBarSection(),
    );
  }
}
