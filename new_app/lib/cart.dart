import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Widget cart_item() {
      return Row(
        children: [
          Container(
            width: width / 6,
            height: height / 10,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 5, spreadRadius: 3, offset: Offset(1, 2))
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: AssetImage(
                    'assets/figo1.jpg',
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
                    Text("Zenek Martyniuk",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18)), // TUTAJ NAZWA ARTYSTY
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text("Złoty",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13))
                  ], // TUTAJ RODZAJ PAKIETU
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("5 zł"), // TUTAJ KWOTA
                    SizedBox(width: width / 25),

                    TextButton(
                      onPressed: () => setState(() {}),
                      child: Icon(Icons.remove, color: Colors.orange.shade800),
                    ),
                    Text('0'),
                    TextButton(
                      onPressed: () => setState(() {}),
                      child: Icon(Icons.add, color: Colors.orange.shade800),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
    }

    return AlertDialog(
      insetPadding: EdgeInsets.fromLTRB(15, 25, 15, 25),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(width: 2, color: Colors.black)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          cart_item(),
          Divider(color: Colors.orange[800], thickness: 1),
          cart_item(),
          Divider(color: Colors.orange[800], thickness: 1),
          cart_item(),
          Divider(
            color: Colors.transparent,
          ),
          Divider(
            color: Colors.transparent,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              alignment: Alignment.centerRight,
              child: Text("15 zł",
                  textAlign: TextAlign.right, style: TextStyle(fontSize: 30)),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: height / 30,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/product');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text(
                  'Zapłać teraz!',
                  style: TextStyle(fontFamily: 'Italic', fontSize: 15),
                )),
          ),
        ],
      ),
    );
  }
}
