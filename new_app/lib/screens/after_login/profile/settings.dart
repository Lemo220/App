import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your settings'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: height / 1.1,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/bg5.jpg'),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: height / 4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/background_profile.jpg',
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 8),
                          child: Container(
                            width: 30,
                            height: 30,
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                size: 25,
                              ),
                              color: Colors.amber[900],
                              onPressed: () {}, // change image here
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: (height / 2.5),
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: Color(0xFF000000),
                          )
                        ],
                      ),
                      child: Column(children: [
                        Divider(),
                        Container(
                          width: width / 1.29,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Nickname",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        buildTextField('Jarek'),
                        Container(
                          width: width / 1.29,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        buildTextField('jarek@gmail.com'),
                        Container(
                          width: width / 1.29,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Phone",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        buildTextField('+48 606 606 606'),
                        Divider(),
                        Divider(),
                        Container(
                          width: width / 1.29,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 100,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Save",
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.red[400]),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Cancel",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ]),
                ),
                Positioned(
                  top: (height /
                      8), // (background container size) - (circle height / 2)
                  child: Container(
                    height: height / 4,
                    width: height / 4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 4,
                      ),
                      boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 4)],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/profile.png"),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 30,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_enhance,
                            size: 25,
                          ),
                          color: Colors.amber[900],
                          onPressed: () {}, // change image here
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 100,
                      child: TextButton.icon(
                        icon: Icon(
                          Icons.delete,
                          size: 10,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                        label: Text(
                          "Delete account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
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
      ),
    );
  }

  Widget buildTextField(String nickname) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
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
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 5),
              child: TextFormField(
                initialValue: '$nickname',
                style: TextStyle(color: Colors.amber[700]),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            Positioned(
                right: 5,
                top: 5,
                child: Icon(Icons.edit, color: Colors.amber[800]))
          ],
        ),
      ),
    );
  }
}
