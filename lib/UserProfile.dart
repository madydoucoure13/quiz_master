import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: <Widget>[
        // User profile image
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 10,
            backgroundImage: AssetImage('assets/icons/iconEmail.png'),
          ),
        ),
      ],
    );
  }
}
