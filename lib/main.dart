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
        backgroundColor: Color(0xFF1A2848),
        accentColor: Color(0xFFCD813F),
        buttonColor: Color(0xFFCDB53F),
      ),
      home: CalculatorHomePage(),
    );
  }
}
