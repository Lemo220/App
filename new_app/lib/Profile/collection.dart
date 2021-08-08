import 'package:flutter/material.dart';
import 'package:SzyszkoDisco/other/gradient.dart';
import 'send.dart';

class Collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget collection_item(
        String author, String packet, String packet_description) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: height / 7,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                spreadRadius: 5,
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image(
                    image: AssetImage('assets/mig2.jpg'),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: height / 30,
                        child: GradientText(
                          text: author,
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Text(packet,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    packet_description,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            child: PopupMenuButton(
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                icon: Icon(Icons.menu),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: Container(
                                          width: 80,
                                          child: Row(children: [
                                            Text("SHOW",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ]),
                                        ),
                                        value: 1,
                                      ),
                                      PopupMenuItem(
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Send();
                                                });
                                          },
                                          child: Container(
                                            width: 80,
                                            child: Row(children: [
                                              Text("SEND",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Icon(Icons.call_made,
                                                  color: Colors.green)
                                            ]),
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        child: Container(
                                          width: 80,
                                          child: Row(children: [
                                            Text("SELL",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Icon(Icons.attach_money,
                                                color: Colors.red)
                                          ]),
                                        ),
                                        value: 1,
                                      ),
                                    ]),
                            width: width / 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
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
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            collection_item('Zenek Martyniuk', 'Silver', 'Signature + CD'),
            collection_item(
                'Bracia Figo Fagot', 'Diamond', 'Signature + CD + dedication'),
            collection_item('Mig', 'Silver', 'Signature + CD + dedication'),
            collection_item(
                'Zenek Martyniuk', 'Gold', 'Signature + dedication'),
            collection_item('Bracia Figo Fagot', 'Platinum',
                'Signature + Song + dedication'),
            collection_item(
                'Zenek Martyniuk', 'Gold', 'Signature + CD + dedication'),
          ],
        ));
  }
}

