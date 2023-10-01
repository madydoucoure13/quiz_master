import 'package:flutter/material.dart';
    
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset('assets/images/rounded.png'),
                ),
                Positioned(
                  top: 12,
                  left: 39,
                  child: Image.asset('assets/images/logo.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}