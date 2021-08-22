import 'package:SzyszkoDisco/other/item.dart';
import 'package:SzyszkoDisco/screens/after_login/marketplace_sell.dart';
import 'package:flutter/material.dart';
import '../../other/item.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

import 'package:assets_audio_player/assets_audio_player.dart';

class product_owned extends StatefulWidget {
  @override
  _product_ownedState createState() => new _product_ownedState();
}

class _product_ownedState extends State<product_owned>
    with SingleTickerProviderStateMixin {
  late AnimationController
      iconController; // make sure u have flutter sdk > 2.12.0 (null safety)
  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    loadAsset();
    super.initState();
    iconController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    audioPlayer.open(Audio('assets/voice/feliks.mp3'),
        autoStart: false, showNotification: true);
  }

  final assetsAudioPlayer = AssetsAudioPlayer();

  String data = '';
  Future<void> loadAsset() async {
    final _loadedData = await rootBundle.loadString('assets/artists/zenek.txt');
    setState(() {
      data = _loadedData;
    });
  }

  void AnimateIcon() {
    setState(() {
      isAnimated = !isAnimated;
      if (isAnimated) {
        iconController.forward();
        audioPlayer.play();
      } else {
        iconController.reverse();
        audioPlayer.pause();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    iconController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  generateImage(choosen_item.artist)),
                              fit: BoxFit.cover,
                              height: (MediaQuery.of(context).size.height / 3),
                              width: (double.infinity),
                            ),
                          ),
                          Row(children: [
                            Container(
                              width: (MediaQuery.of(context).size.width / 2.3),
                              height: (MediaQuery.of(context).size.height / 11),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  choosen_item.artist,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange.shade800),
                                ),
                              ),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width / 2.2),
                              height: 60,
                              child: Image(
                                image: AssetImage('assets/black_button.png'),
                                fit: BoxFit.fill,
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
                      Container(
                        width: double.infinity,
                        child: Row(children: [
                          Column(
                            children: [
                              Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 450,
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: DefaultTabController(
                                    length: 2,
                                    child: Scaffold(
                                      backgroundColor: Colors.black,
                                      appBar: PreferredSize(
                                        preferredSize: Size.fromHeight(
                                            50.0), // here the desired height
                                        child: AppBar(
                                          backgroundColor: Colors.black,
                                          primary: false,
                                          automaticallyImplyLeading: false,
                                          bottom: const TabBar(
                                            tabs: [
                                              Tab(
                                                text: "Content",
                                              ),
                                              Tab(
                                                text: "History",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      body: TabBarView(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    'assets/podpis.png'),
                                                width: 300,
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  AnimateIcon();
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 4,
                                                          spreadRadius: 4)
                                                    ],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: AnimatedIcon(
                                                    icon: AnimatedIcons
                                                        .play_pause,
                                                    progress: iconController,
                                                    size: 50,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Column(
                                              children: [
                                                transaction_history(
                                                    Icons.attach_money,
                                                    '22.06.2005',
                                                    false),
                                                transaction_history(
                                                    Icons.shuffle,
                                                    '22.06.2008',
                                                    false),
                                                transaction_history(
                                                    Icons.shuffle,
                                                    '22.06.2010',
                                                    true),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
    );
  }

  Widget transaction_history(icon, date, last) {
    return Container(
      width: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 4)],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/button_bg.png'),
                  ),
                ),
                child: Text(
                    (owner..shuffle()).first +
                        "#" +
                        (random.nextInt(8999) + 1000).toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                    )),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 90,
                height: 30,
                child: Text(" " + date,
                    style: TextStyle(
                      fontSize: 13,
                    )),
              ),
            ],
          ),
          Divider(),
          if (last == false)
            Icon(
              Icons.keyboard_arrow_down,
            ),
          Divider(),
        ],
      ),
    );
  }
}
