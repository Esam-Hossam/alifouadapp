import 'package:alifouadapp/Controls/normalbutton.dart';
import 'package:alifouadapp/Screens/updateinfoScreen.dart';
import 'package:alifouadapp/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home Page")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Wrap(runSpacing: 15, children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.person_outline,
                    color: primaryColor,
                  ),
                ),
                Text(
                  "Test01 t",
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.phone_android,
                    color: primaryColor,
                  ),
                ),
                Text("+971 559944652"),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.mail_outline,
                    color: primaryColor,
                  ),
                ),
                Text("test@test.test"),
              ],
            ),
            normalbutton(
              () => {Get.to(() => UpdateinfoPage())},
              Row(
                  children: [Text("Update Information"), Icon(Icons.chevron_right)],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
              BorderEnabled: false,
            ),
            normalbutton(
              () => {},
              Row(
                  children: [Text("Change Password"), Icon(Icons.chevron_right)],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
              BorderEnabled: false,
            ),
            normalbutton(
              () => {},
              Row(
                  children: [Text("Delete Account"), Icon(Icons.chevron_right)],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
              BorderEnabled: false,
            ),
            normalbutton(
              () => {},
              Row(
                  children: [Text("Logout"), Icon(Icons.chevron_right)],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
              BorderEnabled: false,
            ),
          ]),
        ));
  }
}
