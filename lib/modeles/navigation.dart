import 'package:flutter/material.dart';
import 'package:quiz_master/page_accueil.dart';
import 'package:quiz_master/dashboard.dart';
import 'package:quiz_master/profil_utilisateur.dart';
import 'package:quiz_master/NotificationPage.dart';



class NavBar extends StatefulWidget {

  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _Navbar();
}

class _Navbar extends State<NavBar>{

PageController _pageController = PageController();
   int _currentPage = 0;
  
  List<Widget> pages = [
    const Dashboard(),
    // ProfilUtilisateur(),
    NotificationPage(),
    // PageProfil(),
    // const PageAccueil(),

  ];


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
       controller: _pageController,
        children: pages,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (int page) {
          _pageController.jumpToPage(page);
        },

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Business',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'School',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Settings',
            backgroundColor: Colors.blue,
          ),
        ],
        selectedItemColor:  const Color.fromARGB(255, 243, 201, 33),
              ),
    );
  }
}