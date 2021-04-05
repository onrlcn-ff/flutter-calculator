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
        backgroundColor: Color(0xFF0A3E4A),
        accentColor: Color(0xFFDB6568),
        buttonColor: Color(0xFFDDBC66),
      ),
      home: CalculatorHomePage(),
    );
  }
}
