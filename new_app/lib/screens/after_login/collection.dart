import 'package:SzyszkoDisco/screens/after_login/marketplace_sell.dart';
import 'package:SzyszkoDisco/screens/after_login/product_owned.dart';
import 'package:flutter/material.dart';
import 'package:SzyszkoDisco/other/gradient.dart';
import 'send.dart';
import '../../other/item.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'mainpage.dart';
import '../before_login/login.dart';
import 'marketplace.dart';
import 'marketplace_sell.dart';

class Collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget collection_item(Item item) {
      return FocusedMenuHolder(
          menuWidth: MediaQuery.of(context).size.width / 2,
          blurSize: 5.0,
          menuItemExtent: 55,
          menuBoxDecoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.amber.shade800,
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
          ),
          duration: Duration(milliseconds: 100),
          animateMenuItems: true,
          openWithTap: true,
          menuOffset:
              10.0, // Offset value to show menuItem from the selected item
          bottomOffsetHeight:
              80.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
          menuItems: <FocusedMenuItem>[
            FocusedMenuItem(
                backgroundColor: Colors.black,
                title: Text(
                  "Show",
                  style: TextStyle(color: Colors.white),
                ),
                trailingIcon: Icon(Icons.visibility),
                onPressed: () {
                  choosen_item = item;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => product_owned()));
                }),
            FocusedMenuItem(
                backgroundColor: Colors.black,
                title: Text("Send", style: TextStyle(color: Colors.green)),
                trailingIcon: Icon(
                  Icons.north_east,
                  color: Colors.green,
                ),
                onPressed: () {
                  choosen_item = item;
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Send()));
                }),
            FocusedMenuItem(
                backgroundColor: Colors.black,
                title: Text(
                  "Sell",
                  style: TextStyle(color: Colors.redAccent),
                ),
                trailingIcon: Icon(
                  Icons.attach_money,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  selectedIndex = 1;
                  choosen_item = item;
                  marketplace_index = 1;
                  expand1 = false;
                  expand2 = true;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BottomNavigationMainPage(user: user!)));
                }),
          ],
          onPressed: () {},
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: height / 5,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                child: Row(children: [
                  Container(
                    width: 120,
                    height: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      child: Image(
                        image: AssetImage(item.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 0,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: height / 30,
                            child: GradientText(
                              text: item.artist,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              gradient: LinearGradient(
                                colors: [Colors.amber.shade800, Colors.yellow],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                              left: 30,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  width: 80,
                                  child: Text(item.packet,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 7),
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                'assets/button_bg.png'),
                                          ),
                                        ),
                                        child:
                                            Text("#" + item.counter.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                )),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        width: 110,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                'assets/button_bg.png'),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              size: 17,
                                            ),
                                            Text(" " + item.date,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              )));
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          shadowColor: Colors.white,
          title: Text("Collection"),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/bg5.jpg'),
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(5),
            children: owned_items.map((item) => collection_item(item)).toList(),
          ),
        ));
  }
}
