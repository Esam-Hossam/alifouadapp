import 'package:alifouadapp/controls/actionbutton.dart';
import 'package:alifouadapp/controls/header.dart';
import 'package:alifouadapp/main.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
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
                      actionbutton(() {}, Text("Register"))
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
