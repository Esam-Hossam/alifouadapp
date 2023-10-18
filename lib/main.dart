import 'package:alifouadapp/Screens/welcomeScreen.dart';
import 'package:alifouadapp/Controls/controlthemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
  ));
  runApp(const MainApp());
}

const primaryColor = Color.fromARGB(255, 61, 5, 72);
const primaryFont = "Alexandria";

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: primaryColor,
              titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFont, fontSize: 20),
              centerTitle: true),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: primaryColor,
                displayColor: primaryColor,
                fontFamily: primaryFont,
              ),
          elevatedButtonTheme: controlthemes().AppElevatedButtonTheme,
        ),
        home: WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
