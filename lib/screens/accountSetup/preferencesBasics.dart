import 'dart:io';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focusv1/constants/colors.dart';
import 'package:focusv1/screens/authentication/shared/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:focusv1/services/database.dart';

class PreferencesBasic extends StatefulWidget {
  @override
  _PreferencesBasicState createState() => _PreferencesBasicState();
}

class _PreferencesBasicState extends State<PreferencesBasic> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  File _image;
  bool _loading = true;
  List <String> suggestions;

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

  getCountries() async {
    suggestions = await DatabaseService().getCountriesSetUp().then((value) => value);
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
    List<String> added = [];
    String currentText = "";

    return Scaffold(
      body: LoadingOverlay(
        isLoading: _loading,
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
                          ), SimpleAutoCompleteTextField(
                            decoration: textInputDecoration,
                            textChanged: (text) => currentText = text,
                            clearOnSubmit: true,
                            key: key,
                            suggestions: suggestions,
                            textSubmitted: (text) => setState(() {
                              if (text != "") {
                                added.add(text);
                              }
                            }),
                          )
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
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                    child: RaisedButton(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        onPressed: ()  {},
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
