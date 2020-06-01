import 'package:flutter/material.dart';
import 'package:focusv1/contants/colors.dart';
import 'package:focusv1/screens/authentication/widgets/horizontalText.dart';
import 'package:focusv1/screens/authentication/widgets/verticalText.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [gradient1, gradient2]),
        ),
        child: ListView(
          children: <Widget>[
            Row(children: <Widget>[
              VerticalText(type: 1),
              HorizontalText(type: 0),
            ])
          ],
        ),
      ),
    );
  }
}
