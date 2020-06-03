import 'package:flutter/cupertino.dart';
import 'package:focusv1/screens/authentication/login.dart';
import 'package:focusv1/screens/authentication/register.dart';

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  int page = 0;

  changePage(){
    setState(() {
      page = (page == 0) ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(page == 0){
      return Login(changePage: changePage);
    } else {
      return Register(changePage: changePage);
    }
  }
}
