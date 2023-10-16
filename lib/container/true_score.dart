import 'package:flutter/material.dart';

class TrueScorePage extends StatelessWidget {
  const TrueScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
              "Vos trois derniers scores",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 0.7),
              ),
            ),
          ),
          // Création de mon card

          Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 20, bottom: 0, left: 20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Non de la quiz: SPRING BOOT",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "le 12/12/2023",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 5, right: 7, bottom: 5, left: 7),
                            decoration: BoxDecoration(
                              color: Colors.cyan[700],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "200 points",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          ///////////////////////////////////////////////////////////////////////////////////////////////////

          Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 20, bottom: 0, left: 20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Non de la quiz: SPRING BOOT",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "le 12/12/2023",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 5, right: 7, bottom: 5, left: 7),
                            decoration: BoxDecoration(
                              color: Colors.cyan[700],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "200 points",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          ///////////////////////////////////////////////////////////////////////////////////////////////////

          Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 20, bottom: 0, left: 20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Non de la quiz: SPRING BOOT",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "le 12/12/2023",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 5, right: 7, bottom: 5, left: 7),
                            decoration: BoxDecoration(
                              color: Colors.cyan[700],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "200 points",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
