import 'package:flutter/material.dart';
import '../../other/item.dart';
import 'package:SzyszkoDisco/other/gradient.dart';
import 'package:intl/intl.dart';
import 'marketplace.dart';

bool expand1 = true;
bool expand2 = false;

class MarketPlace_sell extends StatefulWidget {
  const MarketPlace_sell({Key? key}) : super(key: key);

  @override
  _MarketPlace_sellState createState() => _MarketPlace_sellState();
}

late Item choosen_item = (store_items..shuffle()).first;
final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('dd-MM-yyyy');
final String formatted = formatter.format(now);

class _MarketPlace_sellState extends State<MarketPlace_sell> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Widget collection_item(Item item) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () {
            setState(() {
              choosen_item = item;
            });
            expand1 = false;
            expand2 = true;
          },
          child: Container(
            height: height / 7.5,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 130,
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
                        padding: EdgeInsets.only(),
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          child: GradientText(
                            text: item.artist,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            gradient: LinearGradient(
                              colors: [Colors.amber.shade800, Colors.yellow],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                  left: 10,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("#" + item.counter.toString(),
                                            style: TextStyle(
                                              fontSize: 10,
                                            )),
                                      ],
                                    ),
                                    Container(
                                      width: 70,
                                      child: Text(item.packet,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
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
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/bg5.jpg'),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(20),
            child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 2000),
              children: [
                ExpansionPanel(
                  backgroundColor: Colors.transparent,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      autofocus: true,
                      title: Container(
                        padding: EdgeInsets.only(top: 5),
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/button_bg.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Text(
                          '1. Choose packet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.amber[800],
                          ),
                        ),
                      ),
                    );
                  },
                  body: ListTile(
                    title: Container(
                      height: 400,
                      child: SingleChildScrollView(
                        child: Column(
                          children: owned_items
                              .map((item) => collection_item(item))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  isExpanded: expand1,
                  canTapOnHeader: true,
                ),
                ExpansionPanel(
                  backgroundColor: Colors.transparent,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Container(
                        padding: EdgeInsets.only(top: 5),
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/button_bg.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Text(
                          '2. Price',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.amber[800],
                          ),
                        ),
                      ),
                    );
                  },
                  body: ListTile(
                    title: Container(
                      height: 400,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          collection_item(choosen_item),
                          buildTextField(
                              'Price:', false, '', textformfield_price),
                          buildTextField('Date:', true, formatted, date),
                          Divider(
                            height: 90,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () {
                                  int s = int.parse(textformfield_price.text);
                                  setState(() {
                                    marketplace_items.add(Item(
                                        image: choosen_item.image,
                                        artist: choosen_item.artist,
                                        packet: choosen_item.packet,
                                        price: s,
                                        owner: choosen_item.owner,
                                        counter: choosen_item.counter,
                                        date: formatted.toString()));
                                    owned_items.remove(choosen_item);

                                    expand1 = true;
                                    expand2 = false;
                                    FocusScope.of(context).unfocus();
                                    textformfield_price.clear();

                                    marketplace_index = 0;
                                  });

                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Text(
                                        "Congratulations, \nall done!",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.amber[900],
                                ),
                                child: Text(
                                  'Add now!',
                                  style: TextStyle(
                                      fontFamily: 'Italic', fontSize: 15),
                                )),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  isExpanded: expand2,
                  canTapOnHeader: true,
                ),
              ],
              expansionCallback: (panelIndex, isExpanded) {
                if (panelIndex == 0) {
                  expand1 = true;
                  expand2 = false;
                  setState(() {});
                }

                if (panelIndex == 1 && expand2 == false) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "Choose packet first!",
                            textAlign: TextAlign.center,
                          ),
                        );
                      });
                }
                if (panelIndex == 1 && expand2 == true) {
                  expand1 = true;
                  expand2 = false;
                  setState(() {});
                }
              },
            ),
          ),
        ]),
      ),
    );
  }

  final textformfield_price = TextEditingController();
  final date = TextEditingController();
  void dispose() {
    textformfield_price.dispose();
    super.dispose();
  }

  Widget buildTextField(text, read_only, hint, controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(text),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/button_bg.png'), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: TextFormField(
                controller: controller,
                readOnly: read_only,
                style: TextStyle(color: Colors.amber[700]),
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
