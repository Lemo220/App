import 'package:SzyszkoDisco/other/item.dart';
import 'package:SzyszkoDisco/screens/after_login/marketplace_sell.dart';
import 'package:flutter/material.dart';
import '../../other/item.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';

class product_page extends StatefulWidget {
  @override
  _product_pageState createState() => new _product_pageState();
}

class _product_pageState extends State<product_page> {
  String data = '';
  Future<void> loadAsset() async {
    final _loadedData = await rootBundle.loadString('assets/artists/zenek.txt');
    setState(() {
      data = _loadedData;
    });
  }

  @override
  void initState() {
    loadAsset();
  }

  buy_item(int artist_index, String packet) {
    cart_items.clear();
    cart_items.add(
      Item(
        image: generateImage(artist[artist_index]),
        artist: artist[artist_index],
        packet: packet,
        price: checkPrice(packet),
        owner: '',
        counter: random.nextInt(2000),
        date: formatted,
      ),
    );
    Navigator.pushNamed(context, '/payment');
  }

  @override
  Widget build(BuildContext context) {
    Widget BotButton(index, double width_button, double height_button,
        String image, String description) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: 10,
        ),
        child: Container(
          width: (MediaQuery.of(context).size.width / width_button),
          child: GestureDetector(
            onTap: () => {buy_item(artist_index, description)},
            child: Container(child: Image(image: AssetImage(image))),
          ),
        ),
      );
    }

    return ExpandableBottomSheet(
      enableToggle: true,
      persistentHeader: Container(
        child: Column(
          children: [
            Image(
              height: 80,
              width: 150,
              image: AssetImage('assets/buy_now2.png'),
            ),
          ],
        ),
      ),
      expandableContent: Container(
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background_buttons.jpg'),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BotButton(0, 2, 30, 'assets/silver_button.png', packet[0]),
              BotButton(1, 2, 60, 'assets/gold_button.png', packet[1]),
              BotButton(2, 2, 60, 'assets/black_button.png', packet[2]),
            ],
          ),
        ),
      ),
      background: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white30,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/bg5.jpg'),
            ),
          ),
          child: SingleChildScrollView(
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
                                image: AssetImage(
                                    generateImage(artist[artist_index])),
                                fit: BoxFit.cover,
                                height:
                                    (MediaQuery.of(context).size.height / 3),
                                width: (double.infinity),
                              ),
                            ),
                            Row(children: [
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width / 2.3),
                                height:
                                    (MediaQuery.of(context).size.height / 11),
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    artist[artist_index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange.shade800),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 25),
                                width:
                                    (MediaQuery.of(context).size.width / 2.2),
                                height: 50,
                                child: RatingBar(
                                  initialRating: 4,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  ratingWidget: RatingWidget(
                                    full: Image(
                                        image: AssetImage(
                                            'assets/rating/disc_full.png')),
                                    half: Image(
                                        image: AssetImage(
                                            'assets/rating/disc_half.png')),
                                    empty: Image(
                                        image: AssetImage(
                                            'assets/rating/disc_empty.png')),
                                  ),
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                            ]),
                          ]),
                          decoration: BoxDecoration(
                            color: Colors.black,
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
                          padding: EdgeInsets.only(top: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 5, // changes position of shadow
                                ),
                              ],
                            ),
                            width: (MediaQuery.of(context).size.width),
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  inherit: true,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(data),
                                    ],
                                  ),
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
        ),
      ),
    );
  }
}
