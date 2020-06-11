import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focusv1/constants/colors.dart';
import 'package:focusv1/screens/authentication/shared/constants.dart';
import 'package:focusv1/screens/authentication/widgets/horizontalText.dart';
import 'package:focusv1/screens/authentication/widgets/verticalText.dart';
import 'package:focusv1/services/auth.dart';
import 'package:loading_overlay/loading_overlay.dart';

class Login extends StatefulWidget {
  final Function changePage;
  Login({this.changePage});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  String email, password;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: _loading,
        opacity: 0.5,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [gradient1, gradient2]),
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(type: 1),
                  HorizontalText(type: 0),
                ]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Container(
                      height: 85,
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
                            validator: (val) {
                              if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)){
                                setState(() {
                                  email = val.trim();
                                });
                                return null;
                              } else {
                                return 'Bad email';
                              }
                            },
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
                      height: 85,
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
                            obscureText: true,
                            validator: (val) {
                              if(val.length < 6){
                                return 'Please enter a longer password';
                              }
                              setState(() {
                                password = val.trim();
                              });
                              return null;
                            },
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
                        onPressed: () async {
                          setState(() {
                            _loading = true;
                          });
                          if(_formKey.currentState.validate()){
                            await AuthService().signInWithEmailAndPassword(email, password);
                          }
                          setState(() {
                            _loading = false;
                          });
                        },
                        elevation: 5.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.check,
                              color: mainText,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Login",
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
                      child: GestureDetector(
                        onTap: () {
                          this.widget.changePage();
                        },
                        child: Text(
                          "Don't have an account? Login",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}