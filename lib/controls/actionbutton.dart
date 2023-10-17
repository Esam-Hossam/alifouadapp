import 'package:flutter/material.dart';

import '../main.dart';

class actionbutton extends StatelessWidget {
  var action;
  Widget ButtonText;
  Color ButtonBackground;
  Color ButtonForeground;
  bool BorderEnabled = true;

  actionbutton(
    this.action,
    this.ButtonText, {
    this.ButtonBackground = primaryColor,
    this.ButtonForeground = Colors.white,
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
            textStyle: MaterialStatePropertyAll(TextStyle(
                fontFamily: primaryFont,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
            side: MaterialStatePropertyAll(BorderSide(
                color: BorderEnabled ? primaryColor : Colors.transparent))),
        onPressed: action,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: ButtonText,
        ),
      ),
    );
  }
}
