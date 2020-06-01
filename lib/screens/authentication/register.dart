import 'package:flutter/material.dart';
import 'package:focusv1/contants/colors.dart';
import 'package:focusv1/screens/authentication/shared/constants.dart';
import 'package:focusv1/screens/authentication/widgets/horizontalText.dart';
import 'package:focusv1/screens/authentication/widgets/verticalText.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              VerticalText(type: 0),
              HorizontalText(type: 1),
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Text(
                      "Full name",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white
                      ),
                      decoration: textInputDecoration,
                    ),
                  ],
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Text(
                      "Country",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: textInputDecoration,
                    ),
                  ],
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: textInputDecoration,
                    ),
                  ],
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration: textInputDecoration,
                    ),
                  ],
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
              child: RaisedButton(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                onPressed: () => {},
                elevation: 5.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      color: mainText,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20,
                        color: mainText
                      ),
                    )
                  ],
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                  child: Text(
                    "Already have an account? Login",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
