import 'package:alifouadapp/Controllers/UserInfoController.dart';
import 'package:alifouadapp/Controls/normalbutton.dart';
import 'package:alifouadapp/Screens/updateinfoScreen.dart';
import 'package:alifouadapp/Screens/welcomeScreen.dart';
import 'package:alifouadapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

final userInfoController = Get.find<UserInfoController>();

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
                Obx(() => Text(
                      userInfoController.userFullname.value,
                    )),
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
                Obx(() => Text(
                      userInfoController.userPhone.value,
                    )),
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
                Obx(() => Text(
                      userInfoController.userEmail.value,
                    )),
              ],
            ),
            normalbutton(
              Row(
                  children: [Text("Update Information"), Icon(Icons.chevron_right)],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
              () => {Get.to(() => UpdateinfoPage())},
              BorderEnabled: false,
            ),
            normalbutton(
              Row(
                  children: [Text("Change Password"), Icon(Icons.chevron_right)],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
              () => {},
              BorderEnabled: false,
            ),
            normalbutton(
              Row(
                  children: [Text("Delete Account"), Icon(Icons.chevron_right)],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
              () => {},
              BorderEnabled: false,
            ),
            normalbutton(
              Row(
                  children: [Text("Logout"), Icon(Icons.chevron_right)],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween),
              () => {
                Get.offAll(WelcomeScreen()),
                FlutterSecureStorage().deleteAll(),
              },
              BorderEnabled: false,
            ),
          ]),
        ));
  }
}
