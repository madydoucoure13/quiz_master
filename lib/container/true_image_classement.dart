import 'package:flutter/material.dart';
import 'package:quiz_master/container/classement_reste.dart';
// import 'package:quiz_master/container/medaille.dart';

class TrueClassementPage extends StatelessWidget {
  const TrueClassementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 10, bottom: 0, left: 10),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(30),
                        child: Image.asset(
                          "assets/images/profil.png",
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // LEs nom

                  const Center(
                      child: Text(
                    "Almaimoune \n Elmoctar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),

                  // LEs container

                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      right: 10,
                      bottom: 5,
                      left: 10,
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Colors.cyan[700],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "2000",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, right: 0, bottom: 0, left: 0),
                    // margin: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      "assets/images/med2.png",
                      width: 115,
                      height: 115,
                    ),
                  ),
                  // const Center(
                  //   child: Text(
                  //     "Almaimoune \n Elmoctar",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // )
                ],
              ),

              ////////////////////////////////////////////////////////////////////////////////////////

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 10, bottom: 0, left: 10),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(34),
                        child: Image.asset(
                          "assets/images/profil.png",
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // LEs nom

                  const Center(
                      child: Text(
                    "Diakaridia \n Sy",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),

                  // LEs container

                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      right: 10,
                      bottom: 5,
                      left: 10,
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Colors.cyan[700],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "10000",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, right: 0, bottom: 0, left: 0),
                    // margin: const EdgeInsets.only(top: 5),
                    child: Image.asset(
                      "assets/images/med1.png",
                      width: 140,
                      height: 140,
                    ),
                  ),
                  // const Center(
                  //   child: Text(
                  //     // Almaimoune MOHAMED ELMOCTAR
                  //     "Diakaridia \n Sy",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // )
                ],
              ),

              /////////////////////////////////////////////////////////////////////

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 10, bottom: 0, left: 10),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(26),
                        child: Image.asset(
                          "assets/images/profil.png",
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // LEs nom

                  const Center(
                      child: Text(
                    "Doucoure \n Mady",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),

                  // LEs container

                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      right: 10,
                      bottom: 5,
                      left: 10,
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Colors.cyan[700],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "1200",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, right: 0, bottom: 0, left: 0),
                    // margin: const EdgeInsets.only(top: 5),
                    child: Image.asset(
                      "assets/images/med3.png",
                      width: 105,
                      height: 105,
                    ),
                  ),
                  // const Center(
                  //   child: Text(
                  //     // Almaimoune MOHAMED ELMOCTAR
                  //     "Doucoure \n Mady",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // )
                ],
              ),

              ///////////////////
            ],
          ),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  left: 0,
                ),
              ),
              ClassementReste(),
            ],
          )
        ],
      ),
    );
  }
}
