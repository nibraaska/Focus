import 'package:flutter/material.dart';
import 'package:focusv1/screens/authentication/auth_wrapper.dart';
import 'package:focusv1/screens/bottomNavigation/bottomNav.dart';
import 'package:focusv1/services/models/user.dart';
import 'package:provider/provider.dart';


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
        body: AuthWrapper(),
      );
    } else {
      return Scaffold(
        body: BottomNavigation(),
      );
    }
  }
}