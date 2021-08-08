import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';

import 'package:SzyszkoDisco/other/gradient.dart';

class MarketPlace extends StatefulWidget {
  final List<String> list = List.generate(25, (index) => "Text $index");

  @override
  _MarketPlaceState createState() => _MarketPlaceState();
}

class Item {
  Item({
    required this.image,
    required this.artist,
    required this.packet,
    required this.price,
    required this.owner,
  });

  String image;
  String artist;
  int price;
  String packet;
  String owner;
}

class _MarketPlaceState extends State<MarketPlace> {
  List<Item> _items = [];
  final List<String> image = [
    'assets/figo1.jpg',
    'assets/figo2.jpg',
    'assets/figo3.jpg',
    'assets/mig1.jpg',
    'assets/mig2.jpg',
    'assets/spiz1.jpg',
    'assets/disco1.jpg',
  ];
  List artist = ['Zenek Martyniuk', 'Bracia Figo Fagot', 'Akcent'];
  List packet = [
    'Silver packet - signature and photo',
    'Bronze packet - signature',
    'Gold packet - signature, photo, CD'
  ];
  List owner = ['Feliks', 'Piotr', 'Lemo', 'Tomasz'];
  void initState() {
    super.initState();
    setState(() {
      _items = _generateItems();
    });
  }

  Random random = new Random();
  List<Item> _generateItems() {
    return List.generate(20, (int index) {
      return Item(
        image: (image..shuffle()).first,
        artist: (artist..shuffle()).first,
        price: random.nextInt(100),
        packet: (packet..shuffle()).first,
        owner: (owner..shuffle()).first,
      );
    });
  }

  DataCell cells(String item) {
    return DataCell(
      Container(
        width: MediaQuery.of(context).size.width / 4,
        child: Text(item, textAlign: TextAlign.center),
      ),
      onTap: () {
        buy_offer();
      },
    );
  }

  DataRow _createRow(Item item) {
    return DataRow(
      cells: [
        DataCell(
          GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 3)],
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 70,
                height: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                      image: AssetImage(item.image.toString()),
                      fit: BoxFit.fill),
                ),
              ),
              onTap: () {
                buy_offer();
              }),
        ),
        cells(item.artist),
        cells(item.packet),
        cells(item.price.toString() + "zł"),
      ],
    );
  }

  void buy_offer() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Are You sure?"),
              ]),
              content: Container(
                height: MediaQuery.of(context).size.height / 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(("test"), textAlign: TextAlign.center),
                  ],
                ),
              ),
              actions: <Widget>[
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Text(
                            'Yes',
                            style:
                                TextStyle(fontFamily: 'Italic', fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Text(
                            'No',
                            style:
                                TextStyle(fontFamily: 'Italic', fontSize: 20),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget data_column(String text) {
      return Container(
        alignment: Alignment.center,
        width: width / 4.5,
        child: GradientText(
          text: text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          gradient: LinearGradient(
            colors: [Colors.amber.shade800, Colors.yellow],
          ),
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(widget.list));
              },
              icon: Icon(Icons.search),
            )
          ],
          centerTitle: true,
          title: BorderedText(
            strokeWidth: 0.5,
            strokeColor: Colors.red,
            child: Text('MARKETPLACE',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.amber[700])),
          ),
          bottom: TabBar(
            labelColor: Colors.amber[700],
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.attach_money),
                text: "Buy",
              ),
              Tab(
                icon: Icon(Icons.sell),
                text: "Sell",
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          Center(
            child: SingleChildScrollView(
              child: DataTable(
                dataTextStyle: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Georgia',
                ),
                headingTextStyle: const TextStyle(
                    fontFamily: 'Georgia',
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
                showCheckboxColumn: true,
                columnSpacing: 10,
                headingRowHeight: 30,
                dataRowHeight: 100,
                showBottomBorder: true,
                columns: [
                  DataColumn(label: Text('')),
                  DataColumn(label: data_column("ARTIST")),
                  DataColumn(label: data_column("PACKET")),
                  DataColumn(label: data_column("PRICE")),
                ],
                rows: _items.map((item) => _createRow(item)).toList(),
              ),
            ),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
        ]),
      ),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ["Zenek", "Figo fago"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
