import 'package:SzyszkoDisco/Profile/change_password.dart';
import 'package:flutter/material.dart';
import 'Create_account.dart';
import 'MainPage.dart';
import 'product.dart';
import 'cart.dart';
import 'marketplace.dart';
import 'Profile/profile.dart';
import 'Profile/settings.dart';
import 'LoginPage.dart';
import 'Profile/collection.dart';

int _selectedIndex = 0;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signatures!',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[850],
        accentColor: Colors.black,
        fontFamily: 'Georgia',
      ),
      home: MyHomePage(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/first': (context) => Create_account_page(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => BottomNavigationMainPage(),
        '/product': (context) => product_page(),
        '/cart': (context) => MyCart(),
        '/marketplace': (context) => MarketPlace(),

        '/settings': (context) => Settings(),
        '/changepassword': (context) => ChangePassword(),
        '/profile': (context) => Profile(),
        '/collection': (context) => Collection(),
      },
    );
  }
}

class BottomNavigationMainPage extends StatefulWidget {
  static List<Widget> _pages = <Widget>[
    MainPageMainMenu(),
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
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
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
        child: BottomNavigationMainPage._pages.elementAt(_selectedIndex),
      ),
    );
  }
}
