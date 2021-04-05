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
        child: Center(
            child: Text(buttonName,
                style: TextStyle(
                    fontSize: 22, color: Theme.of(context).backgroundColor))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Column(children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.bottomRight,
                      width: MediaQuery.of(context).size.width,
                      child: Text(process,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      width: MediaQuery.of(context).size.width,
                      child: Text(result,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 48,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ),
          Table(
            border: TableBorder.all(
                color: Theme.of(context).backgroundColor,
                style: BorderStyle.solid),
            children: [
              TableRow(children: [
                calculatorKeys(
                    buttonName: "AC", color: Theme.of(context).buttonColor),
                calculatorKeys(
                    buttonName: "<-", color: Theme.of(context).buttonColor),
                calculatorKeys(
                    buttonName: "", color: Theme.of(context).buttonColor),
                calculatorKeys(
                    buttonName: "/", color: Theme.of(context).buttonColor),
              ]),
              TableRow(children: [
                calculatorKeys(
                    buttonName: "7", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: "8", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: "9", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: "*", color: Theme.of(context).buttonColor),
              ]),
              TableRow(children: [
                calculatorKeys(
                    buttonName: "4", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: "5", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: "6", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: "-", color: Theme.of(context).buttonColor),
              ]),
              TableRow(children: [
                calculatorKeys(
                    buttonName: "1", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: "2", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: "3", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: "+", color: Theme.of(context).buttonColor),
              ]),
              TableRow(children: [
                calculatorKeys(
                    buttonName: "0", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: "00", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: ".", color: Theme.of(context).accentColor),
                calculatorKeys(
                    buttonName: "=", color: Theme.of(context).buttonColor),
              ]),
            ],
          )
        ]),
      ),
    );
  }
}
