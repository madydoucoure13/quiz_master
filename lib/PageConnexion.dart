import 'package:flutter/material.dart';

class PageConnexion extends StatefulWidget {
  const PageConnexion({Key? key}) : super(key: key);

  @override
  _PageConnexionState createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {
  // Les valeurs des champs de saisie
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Les messages d'erreur
  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 852,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 17,
                top: 222,
                child: Container(
                  width: 360,
                  height: 530,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 6,
                top: 234,
                child: SizedBox(
                  width: 382,
                  height: 40,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Connectez-vous sur',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'QUIZZ MASTER !',
                          style: TextStyle(
                            color: Color(0xFF10B2E9),
                            fontSize: 16,
                            fontFamily: 'Kaushan Script',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                left: 39,
                top: 309,
                child: Container(
                  width: 148,
                  height: 34,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF10B2E9)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 207,
                top: 309,
                child: Container(
                  width: 148,
                  height: 34,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF10B2E9)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 211,
                top: 316,
                child: Container(
                  width: 19,
                  height: 19,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/19x19"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 123,
                top: 399,
                child: Container(
                  width: 147,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 50,
                top: 359,
                child: SizedBox(
                  width: 278,
                  height: 31,
                  child: Text(
                    'Ou vous connecter avec votre identifiant',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xB2222222),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.84,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 41,
                top: 430,
                child: SizedBox(
                  width: 120,
                  height: 31,
                  child: Text(
                    'Adresse e-mail',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 41,
                top: 528,
                child: SizedBox(
                  width: 120,
                  height: 31,
                  child: Text(
                    'Mots de passe',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 55,
                top: 465,
                child: SizedBox(
                  width: 156,
                  height: 31,
                  child: Text(
                    'exemple@gmail.com',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 246,
                top: 596,
                child: SizedBox(
                  width: 156,
                  height: 31,
                  child: Text(
                    'Mots de passe oublié',
                    style: TextStyle(
                      color: Color(0xFF10B2E9),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 59,
                top: 596,
                child: SizedBox(
                  width: 156,
                  height: 31,
                  child: Text(
                    'Se rapppeler de moi',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 62,
                top: 768,
                child: SizedBox(
                  width: 270,
                  height: 31,
                  child: Text(
                    '© QuizzMaster | Toute copie interdite',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 103,
                top: 707,
                child: SizedBox(
                  width: 188,
                  height: 31,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Pas de compte ?',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        const TextSpan(
                          text: '  En créer',
                          style: TextStyle(
                            color: Color(0xFF10B2E9),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 55,
                top: 567,
                child: SizedBox(
                  width: 156,
                  height: 31,
                  child: Text(
                    '********************',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 316,
                top: 570,
                child: Container(
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(children: []),
                ),
              ),
              const Positioned(
                left: 76,
                top: 316,
                child: SizedBox(
                  width: 101,
                  height: 19,
                  child: Text(
                    'Facebook',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 239,
                top: 316,
                child: SizedBox(
                  width: 101,
                  height: 19,
                  child: Text(
                    'Google',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 41,
                top: 655,
                child: Container(
                  width: 314,
                  height: 43,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF10B2E9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                left: 7,
                top: 39,
                child: Container(
                  width: 357,
                  height: 189,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/357x189"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 41,
                top: 604,
                child: Container(
                  width: 13,
                  height: 13,
                  decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ),
              const Positioned(
                left: 84,
                top: 666,
                child: SizedBox(
                  width: 225,
                  height: 18,
                  child: Text(
                    'CONNEXION',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFD700),
                      fontSize: 32,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 9,
                top: 14,
                child: Container(
                  width: 41,
                  height: 34,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(children: []),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
