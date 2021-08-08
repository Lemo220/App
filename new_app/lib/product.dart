import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:favorite_button/favorite_button.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:rainbow_color/rainbow_color.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'cart.dart';

class product_page extends StatefulWidget {
  @override
  _product_pageState createState() => new _product_pageState();
}

class _product_pageState extends State<product_page>
    with SingleTickerProviderStateMixin {
  final List<String> buttons = [
    "Bronze",
    "Silver",
    "Gold",
    "Platinum",
    "Diamond",
  ];

  String data = '';
  Future<void> loadAsset() async {
    final _loadedData = await rootBundle.loadString('assets/zenek.txt');
    setState(() {
      data = _loadedData;
    });
  }

  @override
  void initState() {
    loadAsset();
  }

  int _counter = 0;

  void cart2() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Cart"),
                ],
              ),
              content: Container(
                width: (MediaQuery.of(context).size.width / 3),
                height: (MediaQuery.of(context).size.height / 2),
                child: Column(
                  children: [
                    Text("Jeden"),
                    Text("Drugi"),
                    Text("Trzeci"),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _button_pop_up(packet) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(width: 2, color: Colors.black)),
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("How many?",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.amber[700])),
          ]),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(("Your choice: \n$packet packet."),
                  textAlign: TextAlign.center),
              Text("Signature + blablabla"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => setState(() {
                      if (_counter > 0) _counter--;
                    }),
                    child: Icon(Icons.remove),
                  ),
                  Text(_counter.toString()),
                  TextButton(
                    onPressed: () => setState(() {
                      _counter++;
                    }),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            Column(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: BorderedText(
                        strokeWidth: 1,
                        strokeColor: Colors.black,
                        child: Text(
                          'BUY NOW!',
                          style: TextStyle(
                              fontFamily: 'Italic',
                              decorationColor: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      child: BorderedText(
                        strokeWidth: 1,
                        strokeColor: Colors.black,
                        child: Text(
                          'ADD TO CART',
                          style: TextStyle(
                              fontFamily: 'Italic',
                              decorationColor: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget BotButton(index, color, text_color, width_button) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15,
      ),
      child: Container(
        width: (MediaQuery.of(context).size.width / width_button),
        height: 35,
        child: ElevatedButton(
          onPressed: () => _button_pop_up(buttons[index]),
          style: ElevatedButton.styleFrom(
            primary: color,
            textStyle: TextStyle(
              fontSize: 20,
            ),
          ),
          child: Text(buttons[index], style: TextStyle(color: text_color)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white30,
      ),
      bottomNavigationBar: SizedBox(
        height: (MediaQuery.of(context).size.height / 6),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                spreadRadius: 4,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Container(
                  child: Text('Packet:',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.amber[800],
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BotButton(0, Colors.brown, Colors.white, 4),
                  BotButton(1, Colors.grey, Colors.white, 4),
                  BotButton(2, Colors.yellow, Colors.black, 4),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BotButton(3, Colors.white, Colors.black, 3),
                  BotButton(1, Colors.blue[600], Colors.white, 3),
                ],
              )
            ],
          ),
        ),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      child: Column(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image(
                            image: AssetImage('assets/figo3.jpg'),
                            fit: BoxFit.cover,
                            height: (MediaQuery.of(context).size.height / 3),
                            width: (double.infinity),
                          ),
                        ),
                        Row(children: [
                          Container(
                            width: (MediaQuery.of(context).size.width / 2.3),
                            height: (MediaQuery.of(context).size.height / 11),
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "ZENEK MARTYNIUK",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade800),
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width / 2.3),
                            height: (MediaQuery.of(context).size.height / 11),
                            child: Stack(children: [
                              Positioned(
                                right: (10),
                                child: Container(
                                  height: 40,
                                  width: 20,
                                  child: IconButton(
                                    color: Colors.red,
                                    icon: Icon(
                                      Icons.favorite,
                                      size: 30,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              Positioned(
                                right: (50),
                                child: Container(
                                  height: 40,
                                  width: 20,
                                  child: IconButton(
                                    color: Colors.blue,
                                    icon: const Icon(
                                      Icons.facebook,
                                      size: 30,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              Positioned(
                                right: (90),
                                child: Container(
                                  height: 40,
                                  width: 20,
                                  child: IconButton(
                                    color: Colors.green,
                                    icon: const Icon(
                                      Icons.share,
                                      size: 30,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ]),
                      ]),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 5, // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width),
                        child: DefaultTextStyle(
                          style: new TextStyle(
                              inherit: true,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          child: new Center(
                            child: new Column(
                              children: <Widget>[
                                new Text(data),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
