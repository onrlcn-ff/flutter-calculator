import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String process = "0";
  String result = "0";

  proccess(String buttonName) {
    setState(() {
      if (buttonName == "AC") {
        process = "0";
        result = "0";
      } else if (buttonName == "<-") {
        process = process.substring(0, process.length - 1);
      } else if (buttonName == "=") {
        try {
          Parser p = Parser();
          Expression exp = p.parse(process);
          result = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
        } on Exception catch (e) {
          result = "Eror";
        }
      } else {
        if (process == "0" && buttonName != ".") {
          process = buttonName;
        } else {
          process += buttonName;
        }
      }
    });
  }

  Widget calculatorKeys({String buttonName, Color color}) {
    return InkWell(
      onTap: () => proccess(buttonName),
      child: Container(
        height: MediaQuery.of(context).size.height / 11.6,
        color: color,
        child: Center(child: Text(buttonName, style: TextStyle(fontSize: 22))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Container(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          Container(
              alignment: Alignment.bottomRight,
              width: MediaQuery.of(context).size.width,
              child: Text(process,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Container(
              alignment: Alignment.bottomRight,
              width: MediaQuery.of(context).size.width,
              child: Text(result,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold))),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          Divider(
            color: Theme.of(context).primaryColorDark,
          ),
          Table(
            border: TableBorder.all(color: Theme.of(context).primaryColorDark),
            children: [
              TableRow(children: [
                calculatorKeys(buttonName: "AC", color: Colors.amber),
                calculatorKeys(buttonName: "<-", color: Colors.amber),
                calculatorKeys(buttonName: "", color: Colors.amber),
                calculatorKeys(buttonName: "/", color: Colors.amber),
              ]),
              TableRow(children: [
                calculatorKeys(buttonName: "7", color: Colors.teal),
                calculatorKeys(buttonName: "8", color: Colors.teal),
                calculatorKeys(buttonName: "9", color: Colors.teal),
                calculatorKeys(buttonName: "*", color: Colors.amber),
              ]),
              TableRow(children: [
                calculatorKeys(buttonName: "4", color: Colors.teal),
                calculatorKeys(buttonName: "5", color: Colors.teal),
                calculatorKeys(buttonName: "6", color: Colors.teal),
                calculatorKeys(buttonName: "-", color: Colors.amber),
              ]),
              TableRow(children: [
                calculatorKeys(buttonName: "1", color: Colors.teal),
                calculatorKeys(buttonName: "2", color: Colors.teal),
                calculatorKeys(buttonName: "3", color: Colors.teal),
                calculatorKeys(buttonName: "+", color: Colors.amber),
              ]),
              TableRow(children: [
                calculatorKeys(buttonName: "0", color: Colors.teal),
                calculatorKeys(buttonName: "00", color: Colors.teal),
                calculatorKeys(buttonName: ".", color: Colors.teal),
                calculatorKeys(buttonName: "=", color: Colors.amber),
              ]),
            ],
          )
        ]),
      ),
    );
  }
}
