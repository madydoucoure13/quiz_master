import 'package:flutter/material.dart';
import 'package:quiz_master/login.dart';
import 'package:quiz_master/main.dart';
import 'package:quiz_master/inscription.dart';

class TabModel {
  final String title;
  final GlobalKey<NavigatorState> navigatorKey;

  TabModel(this.title, this.navigatorKey);
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<TabModel> tabs = [
    TabModel("Page1", GlobalKey<NavigatorState>()),
    TabModel("Page2", GlobalKey<NavigatorState>()),
    TabModel("Page3", GlobalKey<NavigatorState>()),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabs[_currentIndex].title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: tabs
            .map((tab) => BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: tab.title,
                ))
            .toList(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text('Flutter Bottom Navigation Bar'),
            pinned: true,
          ),
        ],
        body: PageView(
          controller: PageController(initialPage: _currentIndex),
          children: tabs.map((tab) {
            return Navigator(
              key: tab.navigatorKey,
              onGenerateRoute: (settings) {
                if (settings.name == '/') {
                  return MaterialPageRoute(
                      builder: (context) => _buildPage(tab));
                }
                // Handle other named routes if needed.
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPage(TabModel tab) {
  if (tab.title == "Page1") {
    return const MyHomePage();
  } else if (tab.title == "Page2") {
    return Navigator(
      key: tab.navigatorKey,
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const login());
        }
        // Gérez d'autres itinéraires nommés si nécessaire.
      },
    );
  } else if (tab.title == "Page3") {
    return const Inscription();
  }
  // Ajoutez une instruction return par défaut (par exemple, un conteneur vide).
  return Container();
}
}
