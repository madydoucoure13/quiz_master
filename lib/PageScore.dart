import 'package:flutter/material.dart';


class PageScore extends StatelessWidget{
  const PageScore({super.key});

  @override
  Widget build(BuildContext context) {
    var size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              width: 395,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(3, 151, 202, 1),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
                child: Column(
                  children: [
                    //Ligne pour classement et mes scores
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ Text ("Mes scores", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.transparent,
                      ),
                      ),
                        Text ("Classement", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.transparent,
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right:  20),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
                ),

              ),
            )
          ],
        ),
      ),
    );
  }

}
