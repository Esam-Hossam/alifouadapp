import 'package:flutter/material.dart';

import '../main.dart';

class normalbutton extends StatelessWidget {
  var action;
  Widget ButtonText;
  Color ButtonBackground;
  Color ButtonForeground;
  bool BorderEnabled = true;

  normalbutton(
    this.action,
    this.ButtonText, {
    this.ButtonBackground = Colors.white,
    this.ButtonForeground = primaryColor,
    this.BorderEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(ButtonBackground),
            foregroundColor: MaterialStatePropertyAll(ButtonForeground),
            textStyle:
                MaterialStatePropertyAll(TextStyle(fontFamily: primaryFont, fontWeight: FontWeight.bold, fontSize: 18)),
            side: MaterialStatePropertyAll(BorderSide(color: BorderEnabled ? primaryColor : Colors.transparent))),
        onPressed: action,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: ButtonText,
        ),
      ),
    );
  }
}
