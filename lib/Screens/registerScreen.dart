import 'package:alifouadapp/Actions/Do_Register.dart';
import 'package:alifouadapp/Controls/actionbutton.dart';
import 'package:alifouadapp/Controls/header.dart';
import 'package:alifouadapp/Screens/loginScreen.dart';
import 'package:alifouadapp/main.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homeScreen.dart';

bool _secureText = true;

class RegistrationPage extends StatefulWidget {
  State<RegistrationPage> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      header("Register"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: FractionallySizedBox(
                          widthFactor: 0.7,
                          child: Wrap(
                            runAlignment: WrapAlignment.center,
                            runSpacing: 15,
                            children: [
                              TextFormField(
                                controller: fullNameController,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  hintText: "Full Name",
                                  fillColor: Colors.white,
                                ),
                              ),
                              TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    hintText: "Phone Number",
                                    fillColor: Colors.white,
                                    prefix: CountryFlag.fromCountryCode(
                                      "ae",
                                      height: 20,
                                      width: 30,
                                    )),
                              ),
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
                              TextFormField(
                                  controller: confirmpasswordController,
                                  textAlign: TextAlign.center,
                                  obscureText: _secureText,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    hintText: 'Confirm Password',
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
                                Text("Register"),
                                () {
                                  Do_Register(
                                    fullNameController.text,
                                    phoneController.text,
                                    emailController.text,
                                    passwordController.text,
                                    confirmpasswordController.text,
                                    countryController.text,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "Already have an account? "),
                  TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () => Get.off(() => LoginPage()),
                      text: "Login",
                      style: TextStyle(
                          decoration: TextDecoration.underline, decorationThickness: 4, fontWeight: FontWeight.w900))
                ], style: TextStyle(fontWeight: FontWeight.w600))),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
