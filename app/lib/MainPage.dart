import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class MainPageMainMenu extends StatefulWidget {
  @override
  _MainPageMainMenuState createState() => _MainPageMainMenuState();
}

class _MainPageMainMenuState extends State<MainPageMainMenu> {
  String _value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 150,
                child: DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Column(children: [Text("Hello Piotr"), Text("Test")]),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.library_books_sharp),
                title: const Text("Your NFT's"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(shadowColor: Colors.white, actions: [
          PopupMenuButton(
              icon: const Icon(Icons.search),
              color: Colors.black,
              elevation: 20,
              enabled: true,
              onSelected: (value) {
                setState(() {
                  _value = _value;
                });
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: TextField(),
                      value: "first",
                    ),
                  ]),
          PopupMenuButton(
              icon: const Icon(Icons.notifications),
              color: Colors.black,
              elevation: 20,
              enabled: true,
              onSelected: (value) {
                setState(() {
                  _value = _value;
                });
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("First"),
                      value: "first",
                    ),
                    PopupMenuItem(
                      child: Text("Second"),
                      value: "Second",
                    ),
                  ])
        ]),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
          ),
        ));
  }
}
