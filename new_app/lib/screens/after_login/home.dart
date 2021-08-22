import 'package:flutter/material.dart';
import '/widget/carousel.dart';
import 'package:bordered_text/bordered_text.dart';
import '../../other/item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _value = "";

  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/bg5.jpg'),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                child: CarouselSales(),
              ),
              Divider(thickness: 1),
              Bestsellers(),
              top_collectors(),
            ],
          ),
        ),
      ),
    );
  }

  Widget top_collectors() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BorderedText(
              strokeWidth: 1,
              strokeColor: Colors.red,
              child: Text(
                'Top collectors',
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
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          addAutomaticKeepAlives: false,
          itemBuilder: (context, index) => Column(
            children: [
              top_collectors_item(index, 1),
              top_collectors_item(index, 2),
              top_collectors_item(index, 3),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget top_collectors_item(int i, one) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15),
            width: 280,
            height: 60,
            child: Row(
              children: [
                Text((i * 3 + one).toString() + ".   "),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 1,
                    ),
                    boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1)],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage((image..shuffle()).first),
                    ),
                  ),
                ),
                Column(children: [
                  Container(
                    width: 180,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 8.0, bottom: 8, top: 8),
                    child: Text(
                      (owner..shuffle()).first +
                          "#" +
                          (random.nextInt(8999) + 1000).toString(),
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  Container(
                    width: 180,
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      (((i - 8) * 10 + one) * -1).toString() + " NFT's",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bestsellers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BorderedText(
              strokeWidth: 1,
              strokeColor: Colors.red,
              child: Text(
                'Bestsellers',
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
          itemCount: artist.length,
          scrollDirection: Axis.horizontal,
          addAutomaticKeepAlives: false,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                artist_index = index;
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
                          BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 3,
                              offset: Offset(4, 4)),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                            image: AssetImage(generateImage(artist[index])),
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
    ]);
  }
}
