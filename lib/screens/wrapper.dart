import 'package:flutter/material.dart';
import 'package:flutter_firebase_tutorial/models/user.dart';
import 'package:flutter_firebase_tutorial/screens/authenticate/authenticate.dart';
import 'package:flutter_firebase_tutorial/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either home or auth widget
    return user != null ? Home() : Authenticate();
  }
}
