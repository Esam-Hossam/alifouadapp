import 'package:alifouadapp/Screens/onboardingScreen.dart';
import 'package:alifouadapp/controls/controlthemes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

const primaryColor = Color.fromARGB(255, 100, 51, 117);
const primaryFont = "Alexandria";

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: primaryColor,
                displayColor: primaryColor,
                fontFamily: primaryFont,
              ),
          elevatedButtonTheme: controlthemes().AppElevatedButtonTheme,
        ),
        home: Onboarding(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
