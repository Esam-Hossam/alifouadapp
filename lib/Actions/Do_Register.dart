import 'dart:convert';

import 'package:alifouadapp/Controllers/UserInfoController.dart';
import 'package:alifouadapp/Helpers/httprequests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../Controls/normalbutton.dart';
import '../Screens/homeScreen.dart';

Future<void> Do_Register(
    String fullname, String phone, String email, String password, String confirmpassword, String countrycode) async {
  var body = {
    "name": fullname,
    "email": email,
    "phone": phone,
    "country_code": countrycode,
    "password": password,
    "password_confirm": confirmpassword
  };
  try {
    var response = await exec_Request_Multipart("api/user/register", body, "POST");
    var decodedResponse = jsonDecode(await response.stream.bytesToString()) as Map;
    if (response.statusCode == 200 || response.statusCode == 201) {
      await FlutterSecureStorage().write(key: 'userFullname', value: decodedResponse["data"]["name"]);
      await FlutterSecureStorage().write(key: 'userCountryCode', value: decodedResponse["data"]["country_code"]);
      await FlutterSecureStorage().write(key: 'userPhone', value: decodedResponse["data"]["phone"]);
      await FlutterSecureStorage().write(key: 'userEmail', value: decodedResponse["data"]["email"]);
      await FlutterSecureStorage().write(key: 'userToken', value: decodedResponse["data"]["token"]);
      await FlutterSecureStorage().write(key: 'userTokenExpiry', value: decodedResponse["data"]["token_expiry"]);

      userInfoController.updateUserInfo(
        fullName: await FlutterSecureStorage().read(key: 'userFullname') ?? "",
        email: await FlutterSecureStorage().read(key: 'userEmail') ?? "",
        phone: await FlutterSecureStorage().read(key: 'userPhone') ?? "",
        countryCode: await FlutterSecureStorage().read(key: 'userCountryCode') ?? "",
      );

      Get.offAll(() => HomePage());
    } else {
      Get.defaultDialog(radius: 5, title: "Registration Failed", middleText: decodedResponse["message"], actions: [
        normalbutton(
          Text("OK"),
          () {
            Get.back();
          },
          BorderEnabled: false,
        )
      ]);
    }
  } catch (e) {
    print(e);
  }
}
