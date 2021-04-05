import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        backgroundColor: Color(0xFF46707E),
        accentColor: Color(0xFFCAC66C),
        buttonColor: Color(0xFF86B460),
      ),
      home: CalculatorHomePage(),
    );
  }
}
