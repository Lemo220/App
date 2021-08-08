import 'package:flutter/material.dart';
import 'main.dart' as main;
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bordered_text/bordered_text.dart';
import 'cart.dart';
import 'package:SzyszkoDisco/other/gradient.dart';
import 'marketplace.dart';
import 'Profile/collection.dart';

class MainPageMainMenu extends StatefulWidget {
  @override
  _MainPageMainMenuState createState() => _MainPageMainMenuState();
}

class _MainPageMainMenuState extends State<MainPageMainMenu> {
  String _value = "";

  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer_mainpage(),

      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          shadowColor: Colors.white,
          actions: [
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: CarouselSales(),
          ),
          Divider(thickness: 1),
          Bestsellers(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return MyCart();
              });
        },
        child: const Icon(Icons.shopping_cart),
        backgroundColor: Colors.green,
      ),
    );
  }
/*
  Widget Drawer_mainpage() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(),
              child: Column(children: [
                Container(height: 20),
                GradientText(
                  text: 'Jarek#2341',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.amber.shade800, Colors.yellow],
                  ),
                ),
              ]),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
  */
}

class Bestsellers extends StatelessWidget {
  final List<String> images = [
    'assets/figo1.jpg',
    'assets/figo2.jpg',
    'assets/figo3.jpg',
    'assets/mig1.jpg',
    'assets/mig2.jpg',
    'assets/spiz1.jpg',
    'assets/disco1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BorderedText(
                strokeWidth: 1,
                strokeColor: Colors.red,
                child: Text(
                  'Bestsellers!',
                  style: TextStyle(
                      color: Colors.amber[800],
                      fontFamily: "DejaVu Sans Mono",
                      fontSize: 25),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            addAutomaticKeepAlives: false,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/product');
                },
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 5, spreadRadius: 3)
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                              image: AssetImage(images[index]),
                              fit: BoxFit.fill,
                              height: 140,
                              width: MediaQuery.of(context).size.width / 2.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CarouselSales extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselSales> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 19.0,
                height: 7.0,
                margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 1.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.8 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

final List<String> imgList = [
  'assets/figo4.jpg',
  'assets/akcent1.jpg',
  'assets/dbomb1.jpg',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 3)],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: [
                    Image(
                        image: AssetImage(item),
                        fit: BoxFit.cover,
                        width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(2000, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '90% off',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
