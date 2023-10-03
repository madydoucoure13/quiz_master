import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// void main() {
//   runApp(quiz_create());
// }

class quiz_create extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16,left: 16,top: 16,bottom: 64),
        height: MediaQuery.of(context).size.height*0.80,
        width: MediaQuery.of(context).size.width-32,
        decoration: BoxDecoration(
 
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(MediaQuery.of(context).size.width*.4),
              bottomRight: const Radius.elliptical(5, 3),
              topRight: Radius.circular(0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(1),
                offset: Offset(2, 2),
                blurRadius: 10.0),
          ],
 
        ),
      
    );
  }
}