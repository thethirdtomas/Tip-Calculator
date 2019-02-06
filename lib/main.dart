import 'package:flutter/material.dart';
import 'tip.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tip Calculator',
      theme: new ThemeData(
        primaryColor: Colors.black,
        fontFamily: "roboto"
      ),
      home: Tip(),
    );
  }
}

