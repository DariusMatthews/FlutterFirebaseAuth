import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_tutorial/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Register'),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Please enter email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (val) =>
                    val.isEmpty ? 'Please enter password' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.green[700],
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.signInWithEmailPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Please use valid email and password';
                      });
                    }
                  }
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 12),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
