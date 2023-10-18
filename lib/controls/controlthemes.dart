import 'package:flutter/material.dart';

import '../main.dart';

class controlthemes {
  var AppButtonTheme = ButtonThemeData(
    buttonColor: primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    textTheme: ButtonTextTheme.normal,
  );

  var AppElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  );

  var AppFloatingButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  );

  var AppBarTextStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: primaryFont);

  var AppInputDecorationTheme = InputDecorationTheme(
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white30), borderRadius: BorderRadius.all(Radius.circular(32))),
      fillColor: Colors.grey.shade300,
      labelStyle: TextStyle(color: Colors.black));
}
