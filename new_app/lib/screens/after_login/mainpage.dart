import 'package:flutter/material.dart';
import 'collection.dart';
import 'marketplace.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

int selectedIndex = 0;

class BottomNavigationMainPage extends StatefulWidget {
  final User user;

  const BottomNavigationMainPage({required this.user});

  static List<Widget> _pages = <Widget>[
    HomePage(),
    MarketPlace(),
    Collection(),
  ];

  @override
  _BottomNavigationMainPageState createState() =>
      _BottomNavigationMainPageState();
}

class _BottomNavigationMainPageState extends State<BottomNavigationMainPage> {
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.business),
            icon: Icon(Icons.business),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Collection',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
      body: Center(
        child: BottomNavigationMainPage._pages.elementAt(selectedIndex),
      ),
    );
  }
}
