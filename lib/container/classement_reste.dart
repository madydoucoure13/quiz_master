import 'package:flutter/material.dart';

class ClassementReste extends StatelessWidget {
  const ClassementReste({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 0, bottom: 0, left: 0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: const Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 50.0,
                          ),
                          Positioned(
                            top: 14.0,
                            right: 18.0,
                            child: Text(
                              '4',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      title: const Text(
                        "Sy Diakaridia",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                          right: 15,
                          bottom: 5,
                          left: 15,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.cyan[600],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Positioned(
                          top: 0,
                          right: 0,
                          child: Text(
                            "1000",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ///////
                  ],
                ),
              ),
            ),
          ),

          ////////////////////////////// Mon deuxième padding

          Padding(
            padding:
                const EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: const Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 50.0,
                          ),
                          Positioned(
                            top: 14.0,
                            right: 18.0,
                            child: Text(
                              '5',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      title: const Text(
                        "Fadiga Mamadou",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                          right: 15,
                          bottom: 5,
                          left: 15,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.cyan[600],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Positioned(
                          top: 0,
                          right: 0,
                          child: Text(
                            "900",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ///////
                  ],
                ),
              ),
            ),
          ),

          ////////////////////////////// Mon Troixième padding

          Padding(
            padding:
                const EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: const Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 50.0,
                          ),
                          Positioned(
                            top: 14.0,
                            right: 18.0,
                            child: Text(
                              '6',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      title: const Text(
                        "Touré Drissa",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                          right: 15,
                          bottom: 5,
                          left: 15,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.cyan[600],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Positioned(
                          top: 0,
                          right: 0,
                          child: Text(
                            "800",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ///////
                  ],
                ),
              ),
            ),
          ),

          ////////////////////////////// Mon Quatrième padding

          Padding(
            padding:
                const EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: const Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 50.0,
                          ),
                          Positioned(
                            top: 14.0,
                            right: 18.0,
                            child: Text(
                              '6',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      title: const Text(
                        "Ousmana MAHAMOUDOU",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                          right: 15,
                          bottom: 5,
                          left: 15,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.cyan[600],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Positioned(
                          top: 0,
                          right: 0,
                          child: Text(
                            "600",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ///////
                  ],
                ),
              ),
            ),
          ),

          ////////////////////////////// Mon Quatrième padding

          Padding(
            padding:
                const EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: const Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 50.0,
                          ),
                          Positioned(
                            top: 14.0,
                            right: 18.0,
                            child: Text(
                              '7',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      title: const Text(
                        "Dicko Aicha",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                          right: 15,
                          bottom: 5,
                          left: 15,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.cyan[600],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Positioned(
                          top: 0,
                          right: 0,
                          child: Text(
                            "600",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ///////
                  ],
                ),
              ),
            ),
          ),

          ////////////////////////////// Mon Quatrième padding

          Padding(
            padding:
                const EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: const Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 50.0,
                          ),
                          Positioned(
                            top: 14.0,
                            right: 18.0,
                            child: Text(
                              '8',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      title: const Text(
                        "Mady Doucoure",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                          right: 15,
                          bottom: 5,
                          left: 15,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.cyan[600],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Positioned(
                          top: 0,
                          right: 0,
                          child: Text(
                            "600",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ///////
                  ],
                ),
              ),
            ),
          ),

          ////////////////////////////// Mon Quatrième padding

          Padding(
            padding:
                const EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: const Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 50.0,
                          ),
                          Positioned(
                            top: 14.0,
                            right: 18.0,
                            child: Text(
                              '9',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      title: const Text(
                        "Ibrahim Djingareye",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                          right: 15,
                          bottom: 5,
                          left: 15,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.cyan[600],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Positioned(
                          top: 0,
                          right: 0,
                          child: Text(
                            "600",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ///////
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
