import 'package:alifouadapp/Controllers/UserBinding.dart';
import 'package:alifouadapp/Controllers/UserInfoController.dart';
import 'package:alifouadapp/Controls/actionbutton.dart';
import 'package:alifouadapp/Screens/homeScreen.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class UpdateinfoPage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
                    Obx(
                      () => TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintText: "Full Name",
                          fillColor: Colors.white,
                        ),
                        controller: fullNameController..text = userInfoController.userFullname.value,
                      ),
                    ),
                    Obx(
                      () => TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
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
                        controller: phoneController..text = userInfoController.userPhone.value,
                      ),
                    ),
                    Obx(
                      () => TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintText: "Email Address",
                          fillColor: Colors.white,
                        ),
                        controller: emailController..text = userInfoController.userEmail.value,
                      ),
                    ),
                    actionbutton(Text("Save"), () {
                      userInfoController.updateUserInfo(
                        fullName: fullNameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                      );
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
                    }),
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
