import 'package:flutter/material.dart';
import 'package:focusv1/contants/text.dart';

class VerticalText extends StatefulWidget {
  final int type;
  VerticalText({this.type});
  @override
  _VerticalTextState createState() => _VerticalTextState();
}

class _VerticalTextState extends State<VerticalText> {
  @override
  Widget build(BuildContext context) {
    var text = widget.type == 0 ? "Register" : "Login";
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 20),
      child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: verticalTextSize,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}