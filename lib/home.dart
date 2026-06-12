import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";

  String output = "0";

  Widget button(String text) {
    return Expanded(
      child: SizedBox(
        width: 75,
        height: 75,
        child: ElevatedButton(
          onPressed: () {
            buttonPressed(text);
          },
          child: Text(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: text == "AC" ||
            text == "⌫" ||
            text == "%" ||
            text == "÷" ||
             text == "x" ||
              text == "_" ||
               text == "+" ||
               text == "=" 
            
            
            
            
            
            ?  Colors.indigo
            : Colors.white,
            foregroundColor: Colors.black,
            textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  String evaluateExpression(String expression) {
    try {
      expression = expression.replaceAll("x", "*").replaceAll("÷", "/");
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  void buttonPressed(String value) {
    setState(() {
      if (value == "AC") {
        input = "";
        output = "0";
      } else if (value == "⌫") {
        input = input.isNotEmpty ? input.substring(0, input.length - 1) : "";
      } else if (value == "=") {
        try {
          output = evaluateExpression(input);
        } catch (e) {
          output = "error";
        }
      } else {
        input = input + value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,

                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(input, style: TextStyle(color: Colors.black,fontSize: 50)),
                      Text(
                        output,
                        style: TextStyle(color: Colors.black, fontSize: 70),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      button("AC"),
                      SizedBox(width: 10),
                      button("⌫"),
                      SizedBox(width: 10),
                      button("%"),
                      SizedBox(width: 10),
                      button("÷"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      button("7"),
                      SizedBox(width: 10),
                      button("8"),
                      SizedBox(width: 10),
                      button("9"),
                      SizedBox(width: 10),
                      button("x"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      button("4"),
                      SizedBox(width: 10),
                      button("5"),
                      SizedBox(width: 10),
                      button("6"),
                      SizedBox(width: 10),
                      button("_"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      button("1"),
                      SizedBox(width: 10),
                      button("2"),
                      SizedBox(width: 10),
                      button("3"),
                      SizedBox(width: 10),
                      button("+"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      button("🔁"),
                      SizedBox(width: 10),
                      button("0"),
                      SizedBox(width: 10),
                      button("."),
                      SizedBox(width: 10),
                      button("="),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
