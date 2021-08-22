import 'package:firebase_core/firebase_core.dart';
import 'screens/after_login/profile/change_password.dart';
import 'package:flutter/material.dart';
import 'screens/before_login/create_account.dart';
import 'screens/after_login/product.dart';
import 'screens/after_login/marketplace.dart';
import 'screens/after_login/profile/profile.dart';
import 'screens/after_login/profile/settings.dart';
import 'screens/before_login/login.dart';
import 'screens/after_login/collection.dart';
import 'other/item.dart';
import 'screens/after_login/payment.dart';
import 'screens/after_login/product_owned.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  marketplace_items = generateItems(15);
  owned_items = generateItems(10);

  for (var k = 0; k < 5; k++) {
    for (var l = 0; l < 3; l++) {
      store_items.addAll(generateStoreItems2(i, j));
      j += 1;
    }
    j = 0;
    i += 1;
  }

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.red,
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: LoginPage(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/first': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/product': (context) => product_page(),
        '/payment': (context) => Payment_page(),
        '/marketplace': (context) => MarketPlace(),
        '/settings': (context) => Settings(),
        '/changepassword': (context) => ChangePassword(),
        '/profile': (context) => Profile(),
        '/collection': (context) => Collection(),
        '/product_owned': (context) => product_owned(),
      },
    );
  }
}
