import 'package:alifouadapp/Screens/loginScreen.dart';
import 'package:alifouadapp/Screens/registerScreen.dart';
import 'package:alifouadapp/Controls/actionbutton.dart';
import 'package:alifouadapp/Controls/header.dart';
import 'package:alifouadapp/Controls/normalbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(children: [
            header("Welcome to the app"),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.7,
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  runSpacing: 15,
                  children: [
                    actionbutton(() {
                      Get.to(() => LoginPage());
                    }, Text("Login")),
                    normalbutton(() {
                      Get.to(() => RegistrationPage());
                    }, Text("Register")),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text.rich(TextSpan(children: [
                TextSpan(text: "Designed & Developed by "),
                TextSpan(
                    text: "Ali Fouad",
                    style: TextStyle(
                        decoration: TextDecoration.underline, decorationThickness: 4, fontWeight: FontWeight.w900))
              ], style: TextStyle(fontWeight: FontWeight.w600))),
            )
          ]),
        ),
      ),
    );
  }
}
