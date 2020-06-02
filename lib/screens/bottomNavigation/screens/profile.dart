import 'package:flutter/material.dart';
import 'package:focusv1/services/auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: RaisedButton.icon(
            onPressed: () {
              _auth.signOut();
            },
            label: Text("Sign Out"),
            icon: Icon(Icons.scatter_plot),
          ),
        )
    );
  }
}
