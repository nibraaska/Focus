import 'package:flutter/material.dart';
import 'package:focusv1/constants/text.dart';

class HorizontalText extends StatefulWidget {
  final int type;
  HorizontalText({this.type});
  @override
  _HorizontalTextState createState() => _HorizontalTextState();
}

class _HorizontalTextState extends State<HorizontalText> {
  @override
  Widget build(BuildContext context) {
    var text = widget.type == 0 ? "Build bridges not walls" : "Join others in a world of possibility";
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, left: 30.0),
      child: Container(
        height: 200,
        width: 300,
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: horizontalTextSize,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}