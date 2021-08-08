import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              welcome(),
              InputLogin(),
              PaddingLogin(),
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
              "Hi! Let's start.",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Text(
                "Insert login and password to sign in.",
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(8.0),
        primary: Colors.white,
        textStyle: const TextStyle(fontSize: 10),
      ),
      onPressed: () {},
      child: const Text('Forgot Password?'),
    );
  }
}

class PaddingLogin extends StatelessWidget {
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
            child: Text("Sign In"),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 12),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
              child: InkWell(
                child: Column(
                  children: [
                    SizedBox(
                      height: 13,
                      width: 140,
                      child: Container(
                        child: Text(
                          "You don't have account? \n",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      height: 13,
                      child: Container(
                        child: Text(
                          "Create one! \n",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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

class InputLogin extends StatelessWidget {
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
            hintText: 'Password',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ForgotPassword(),
          ],
        ),
      ],
    );
  }
}
