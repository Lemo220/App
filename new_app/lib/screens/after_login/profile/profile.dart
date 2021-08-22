import 'package:flutter/material.dart';
import 'package:SzyszkoDisco/other/gradient.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? result = FirebaseAuth.instance.currentUser;
  Widget build(BuildContext context) {
    bool _isSigningOut = false;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg5.jpg'), fit: BoxFit.cover),
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
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: 10)],
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/background_profile.jpg')),
                  ),
                ),
              ],
            ),
            Positioned(
                top: (height / 2.5),
                child: Column(children: [
                  GradientText(
                    text: 'Jarek#2341',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.amber.shade800, Colors.yellow],
                    ),
                  ),
                  SizedBox(height: height / 7),
                  button("Edit profile", Icons.settings, '/settings'),
                  Divider(),
                  Divider(),
                  button("Change password", Icons.autorenew, '/changepassword'),
                  Divider(),
                  Divider(),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        _isSigningOut = true;
                      });
                      await FirebaseAuth.instance.signOut();
                      setState(() {
                        _isSigningOut = false;
                      });
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: MediaQuery.of(context).size.height / 23,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/button_bg.png')),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GradientText(
                              text: 'Sign out',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              gradient: LinearGradient(
                                colors: [Colors.amber.shade800, Colors.yellow],
                              ),
                            ),
                            Icon(Icons.logout, color: Colors.amber[300]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ])),

            // Profile image
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(
    String button_text,
    button_icon,
    destination,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '$destination');
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.6,
        height: MediaQuery.of(context).size.height / 23,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/button_bg.png')),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientText(
                text: '$button_text',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                gradient: LinearGradient(
                  colors: [Colors.amber.shade800, Colors.yellow],
                ),
              ),
              Icon(button_icon, color: Colors.amber[300]),
            ],
          ),
        ),
      ),
    );
  }
}
