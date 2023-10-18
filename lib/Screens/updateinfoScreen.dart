import 'package:alifouadapp/Controls/actionbutton.dart';
import 'package:alifouadapp/Screens/homeScreen.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateinfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Information")),
      body: Center(
        child: Column(
          children: [
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
                      controller: TextEditingController()..text = "test01 t",
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
                      controller: TextEditingController()..text = "559944652",
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
                      controller: TextEditingController()..text = "test@test.test",
                    ),
                    actionbutton(() {
                      Get.offAll(() => HomePage());
                      Get.showSnackbar(GetSnackBar(
                        title: "Success",
                        messageText: Text(
                          "Your information is updated successfully",
                          style: TextStyle(color: Colors.white),
                        ),
                        duration: Duration(seconds: 3),
                        animationDuration: Duration(milliseconds: 500),
                        backgroundColor: Color.fromARGB(255, 77, 174, 80),
                      ));
                    }, Text("Save")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
