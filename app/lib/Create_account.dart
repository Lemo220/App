import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Create_account_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              welcome(),
              CreateAccount(),
              CreateButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Let's create account",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Fill up and click create button",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}

class CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 40,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text("Create account"),
            onPressed: () {},
          ),
        ),
        Divider(
          height: 20,
          thickness: 3,
          indent: 10,
          endIndent: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: SignInButton(
            Buttons.GoogleDark,
            text: "Sign in with Google",
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: SignInButton(
            Buttons.Facebook,
            text: "Sign in with Facebook",
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: SignInButton(
            Buttons.AppleDark,
            text: "Sign in with Apple",
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Login',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Password',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Again password',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Phone',
          ),
        ),
      ],
    );
  }
}
