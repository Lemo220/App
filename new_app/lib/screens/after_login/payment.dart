import 'package:SzyszkoDisco/other/item.dart';
import 'package:SzyszkoDisco/other/gradient.dart';
import 'package:SzyszkoDisco/screens/after_login/marketplace_sell.dart';
import 'package:flutter/material.dart';

class Payment_page extends StatefulWidget {
  @override
  _Payment_pageState createState() => _Payment_pageState();
}

class _Payment_pageState extends State<Payment_page> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Widget cart_item(Item item) {
      return Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(blurRadius: 5, spreadRadius: 3, offset: Offset(1, 2))
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: AssetImage(
                    item.image,
                  ),
                  fit: BoxFit.fill,
                )),
          ),
          Wrap(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    GradientText(
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(item.packet,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text('#' + item.counter.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13))
                  ],
                ),
              ),
            ],
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/bg5.jpg'),
            ),
          ),
          width: width,
          height: height / 1.1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5, spreadRadius: 3, offset: Offset(1, 2))
                    ],
                  ),
                  width: width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:
                          cart_items.map((item) => cart_item(item)).toList(),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Wrap(direction: Axis.vertical, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text('Payment method', style: TextStyle(fontSize: 11)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15.0,
                    top: 10,
                  ),
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/button_bg.png'),
                      ),
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.black,
                      value: dropdownValue,
                      hint: Text(
                        "Choose payment method",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      underline: Container(color: Colors.transparent),
                      isExpanded: true,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      style: const TextStyle(color: Colors.amber),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: [
                        'Blik',
                        'Przelew24',
                        'PayU',
                        'Karta',
                        'Google Pay'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ]),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Text(cart_items[0].price.toString() + " zł",
                            style: TextStyle(fontSize: 30)),
                        Text("Vat included",
                            style: TextStyle(fontSize: 10, color: Colors.grey))
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20, left: 10, right: 10, top: 10),
                child: Container(
                  width: double.infinity,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        pay_for_product();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: Text(
                        'Zapłać teraz!',
                        style: TextStyle(fontFamily: 'Italic', fontSize: 15),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pay_for_product() {
    if (dropdownValue == 'Blik')
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/button_bg.png'),
                        fit: BoxFit.fill),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.amber[700]),
                    decoration: InputDecoration(
                      hintText: 'Kod blik',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      cart_items.clear();
                      owned_items.add(choosen_item);

                      marketplace_items.removeWhere((item) =>
                          item.artist == choosen_item.artist &&
                          item.counter == choosen_item.counter);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          contentPadding: EdgeInsets.all(0),
                          content: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    offset: Offset(0, 0)),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width / 3,
                            height: 150,
                            child: Text(
                              "Płatność jest przetwarzana.\n\n\nAkceptuj płatność w aplikacji bankowej.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Zapłać',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
