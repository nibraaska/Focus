import 'package:flutter/material.dart';
import 'package:focusv1/screens/authentication/register.dart';
import 'package:focusv1/services/models/user.dart';
import 'package:provider/provider.dart';

import 'authentication/login.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null){
      return Scaffold(
        body: Login(),
      );
    } else {
      return Scaffold(
        body: Text("Main page"),
      );
    }
  }
}