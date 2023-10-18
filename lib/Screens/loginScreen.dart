import 'dart:convert';

import 'package:alifouadapp/Controllers/UserInfoController.dart';
import 'package:alifouadapp/Controls/header.dart';
import 'package:alifouadapp/Controls/normalbutton.dart';
import 'package:alifouadapp/Helpers/easyloader.dart';
import 'package:alifouadapp/Helpers/httprequests.dart';
import 'package:alifouadapp/Screens/homeScreen.dart';
import 'package:alifouadapp/Screens/registerScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../Actions/Do_Login.dart';
import '../Controls/actionbutton.dart';
import '../main.dart';

bool _secureText = true;

class LoginPage extends StatefulWidget {
  State<LoginPage> createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 2, child: header("Login")),
        Flexible(
          flex: 3,
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: Wrap(
              runSpacing: 15,
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintText: "Email Address",
                    fillColor: Colors.white,
                  ),
                ),
                TextFormField(
                    controller: passwordController,
                    textAlign: TextAlign.center,
                    obscureText: _secureText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: _secureText
                            ? const Icon(
                                Icons.visibility_off,
                                color: primaryColor,
                                size: 20,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: primaryColor,
                                size: 20,
                              ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Password';
                      }
                      return null;
                    }),
                actionbutton(
                  const Text("Login"),
                  () {
                    Do_Login(emailController.text, passwordController.text);
                  },
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text.rich(TextSpan(children: [
              const TextSpan(text: "Don't have an account? "),
              TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.off(() => RegistrationPage()),
                  text: "Register",
                  style: const TextStyle(
                      decoration: TextDecoration.underline, decorationThickness: 4, fontWeight: FontWeight.w900))
            ], style: const TextStyle(fontWeight: FontWeight.w600))),
          ),
        ),
      ],
    ));
  }
}
