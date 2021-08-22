import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import '../../other/item.dart';
import 'marketplace_sell.dart';
import 'package:SzyszkoDisco/other/gradient.dart';

int marketplace_index = 0;

class MarketPlace extends StatefulWidget {
  final List<String> list = List.generate(25, (index) => "Text $index");

  @override
  _MarketPlaceState createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  DataCell cells(String item, String item2, Item item3) {
    if (item2 == '') {
      return DataCell(
        Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Text(item, textAlign: TextAlign.center),
        ),
        onTap: () {
          buy_offer(item3);
        },
      );
    } else {
      return DataCell(
        Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(item, textAlign: TextAlign.center),
              Text(item2, textAlign: TextAlign.center),
            ],
          ),
        ),
        onTap: () {
          buy_offer(item3);
        },
      );
    }
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
                buy_offer(item);
              }),
        ),
        cells(item.artist, '', item),
        cells(item.packet, '# ' + item.counter.toString(), item),
        cells(item.price.toString() + "zł", item.date, item),
      ],
    );
  }

  buy_offer(Item item) {
    cart_items.clear();
    cart_items.add(
      Item(
          image: item.image,
          artist: item.artist,
          packet: item.packet,
          price: item.price,
          owner: item.owner,
          counter: item.counter,
          date: item.date),
    );
    choosen_item = (Item(
        image: item.image,
        artist: item.artist,
        packet: item.packet,
        price: item.price,
        owner: item.owner,
        counter: item.counter,
        date: item.date));
    Navigator.pushNamed(context, '/payment');
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
      initialIndex: marketplace_index,
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg5.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: TabBarView(children: <Widget>[
            Center(
              child: SingleChildScrollView(
                child: Container(
                  width: width / 1.05,
                  child: DataTable(
                    dividerThickness: 3,
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
                    columnSpacing: 1,
                    headingRowHeight: 30,
                    dataRowHeight: 100,
                    showBottomBorder: true,
                    columns: [
                      DataColumn(label: Text('')),
                      DataColumn(label: data_column("")),
                      DataColumn(label: data_column("")),
                      DataColumn(label: data_column("")),
                    ],
                    rows: marketplace_items
                        .map((item) => _createRow(item))
                        .toList(),
                  ),
                ),
              ),
            ),
            Center(
              child: MarketPlace_sell(),
            ),
          ]),
        ),
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
