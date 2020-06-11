import 'package:flutter/material.dart';
import 'package:focusv1/screens/accountSetup/preferencesBasics.dart';
import 'package:focusv1/screens/wrapper.dart';
import 'package:focusv1/services/auth.dart';
import 'package:focusv1/services/models/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Focus',
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
