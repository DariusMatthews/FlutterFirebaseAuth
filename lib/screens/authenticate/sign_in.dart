import 'package:flutter/material.dart';
import 'package:flutter_firebase_tutorial/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20,
        ),
        child: Center(
          child: RaisedButton(
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              result == null ? print('error signing in') : print(result.uid);
            },
            child: Text('Sign in anon'),
            color: Colors.brown,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
