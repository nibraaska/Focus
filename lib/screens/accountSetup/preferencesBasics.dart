import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focusv1/constants/colors.dart';
import 'package:focusv1/screens/authentication/shared/constants.dart';
import 'package:image_picker/image_picker.dart';

class PreferencesBasic extends StatefulWidget {
  @override
  _PreferencesBasicState createState() => _PreferencesBasicState();
}

class _PreferencesBasicState extends State<PreferencesBasic> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  File _image;

  getImage(){
    if (_image == null){
      return CircleAvatar(
        radius: 100.0,
        child: ClipOval(
          child: Image.asset('assets/avatar.png', fit: BoxFit.cover, height: 200, width: 200,),
        ),
      );
    } else {
      return CircleAvatar(
        child: ClipOval(
          child: Image.file(_image, fit: BoxFit.cover, height: 200, width: 200,),
        ),
        radius: 100.0,
      );
    }
  }

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
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 100, 30, 70),
                child: Container(
                  child: InkWell(
                    onTap: () async {
                      var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                      setState(() {
                        _image = File(pickedFile.path);
                        getImage();
                      });
                    },
                    child: getImage()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Container(
                    height: 85,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Text(
                          "School",
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
                    height: 85,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Text(
                          "Distance",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.white
                          ),
                          decoration: textInputDecoration,
                        ),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
