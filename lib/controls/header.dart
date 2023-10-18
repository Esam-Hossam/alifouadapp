import 'package:flutter/material.dart';

class header extends StatelessWidget {
  String title;
  header(this.title);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FractionallySizedBox(
          widthFactor: 0.4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset("assets/images/ali_fouad_logo.png"),
          )),
      Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ]);
  }
}
