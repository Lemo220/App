import 'package:SzyszkoDisco/screens/after_login/marketplace_sell.dart';
import 'package:flutter/material.dart';
import 'package:SzyszkoDisco/other/gradient.dart';
import 'collection.dart';

class Send extends StatefulWidget {
  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<Send> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return AlertDialog(
      insetPadding: EdgeInsets.fromLTRB(15, 25, 15, 25),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(width: 2, color: Colors.black)),
      content: Container(
        height: height / 2.5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: height / 7,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                        child: Image(
                          image: AssetImage(choosen_item.image),
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
                              left: 10,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              height: height / 30,
                              child: GradientText(
                                text: choosen_item.artist,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.amber.shade800,
                                    Colors.yellow
                                  ],
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
                                        Text(choosen_item.packet,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
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
            Container(
              width: width / 1.4,
              child: Text("Recipient",
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 13)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  border: Border.all(
                    color: Colors.grey.shade700,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.amber[700]),
                    decoration: InputDecoration(
                      hintText: "Nickname#1234",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: width / 3,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: Text("SEND",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.pop(context);

                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                                content: Text(
                              "Congratulations, \nall done!",
                              textAlign: TextAlign.center,
                            )));
                  },
                ),
              ),
              SizedBox(
                width: width / 3,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text("CANCEL",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
