import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Calculator",
            ),
          ),
        ),
        body: CalculatorBody(),
      ),
    );
  }
}

class CalculatorBody extends StatefulWidget {
  @override
  _CalculatorBodyState createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  void display(String text) {
    if (text == 'C') {
      setState(() {
        displayText = '0';
        calculationText = '';
        calculationTextTrack = '';
        num1 = 0.0;
        num2 = 0.0;
        operator = '';
      });
    } else if (text == '+' ||
        text == '-' ||
        text == 'X' ||
        text == '/' ||
        text == '%') {
      if (calculationTextTrack != '') {
        setState(() {
          ansfound = false;
        });
        if (operator != '+' &&
            operator != '-' &&
            operator != 'X' &&
            operator != '/' &&
            operator != '%') {
          operator = text;
          setState(() {
            calculationText += operator;
          });
          num1 = double.parse(calculationTextTrack);
          decimal = '';
          calculationTextTrack = '';
        }
      }
    } else if (text == '=') {
      num2 = double.parse(calculationTextTrack);
      calculationTextTrack = '';
      setState(() {
        if (operator == "+") {
          displayText = (num1 + num2).toStringAsFixed(1);
          num1 = double.parse(displayText);
          calculationText = num1.toStringAsFixed(1);
          calculationTextTrack = calculationText;
          operator = '';
          decimal = '';
        }
        if (operator == "-") {
          displayText = (num1 - num2).toStringAsFixed(1);
          num1 = double.parse(displayText);
          calculationText = num1.toStringAsFixed(1);
          operator = '';
          calculationTextTrack = calculationText;
          decimal = '';
        }
        if (operator == "X") {
          displayText = (num1 * num2).toStringAsFixed(1);
          num1 = double.parse(displayText);
          calculationText = num1.toStringAsFixed(1);
          operator = '';
          calculationTextTrack = calculationText;
          decimal = '';
        }
        if (operator == "/") {
          displayText = (num1 / num2).toStringAsFixed(1);
          num1 = double.parse(displayText);
          calculationText = num1.toStringAsFixed(1);
          operator = '';
          calculationTextTrack = calculationText;
          decimal = '';
        }
        if (operator == "%") {
          displayText = (num1 % num2).toStringAsFixed(1);
          num1 = double.parse(displayText);
          calculationText = num1.toStringAsFixed(1);
          operator = '';
          calculationTextTrack = calculationText;
          decimal = '';
        }
        ansfound = true;
      });
    } else if (text == '.') {
      if (decimal != '.') {
        decimal = text;
        calculationTextTrack += text;
        setState(() {
          calculationText += text;
        });
      }
    } else {
      setState(() {
        if (!ansfound) {
          calculationText += text;
        } else {
          setState(() {
            calculationTextTrack = '';
            calculationText = '';
            ansfound = false;
          });

          calculationText += text;
        }
      });
      calculationTextTrack += text;
    }
  }

  String displayText = '0';
  String calculationText = '';
  String calculationTextTrack = '';
  String operator = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String decimal = '';
  bool ansfound = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                calculationText,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20.0, color: Colors.black38),
              ),
              Text(
                displayText,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  CalcButton(
                      buttonText: '/',
                      buttonColor: Colors.deepPurpleAccent,
                      onpress: display),
                  CalcButton(
                      buttonText: '%',
                      buttonColor: Colors.deepPurpleAccent,
                      onpress: display),
                  CalcButton(
                    flexValue: 2,
                    buttonText: 'C',
                    buttonColor: Colors.lightGreenAccent,
                    onpress: display,
                  )
                ],
              ),
              Row(
                children: [
                  CalcButton(
                    buttonText: '7',
                    onpress: display,
                  ),
                  CalcButton(
                    buttonText: '8',
                    onpress: display,
                  ),
                  CalcButton(
                    buttonText: '9',
                    onpress: display,
                  ),
                  CalcButton(
                    buttonColor: Colors.deepPurpleAccent,
                    buttonText: 'X',
                    onpress: display,
                  )
                ],
              ),
              Row(
                children: [
                  CalcButton(
                    buttonText: '4',
                    onpress: display,
                  ),
                  CalcButton(
                    buttonText: '5',
                    onpress: display,
                  ),
                  CalcButton(
                    buttonText: '6',
                    onpress: display,
                  ),
                  CalcButton(
                    buttonColor: Colors.deepPurpleAccent,
                    buttonText: '-',
                    onpress: display,
                  )
                ],
              ),
              Row(
                children: [
                  CalcButton(
                    buttonText: '1',
                    onpress: display,
                  ),
                  CalcButton(
                    buttonText: '2',
                    onpress: display,
                  ),
                  CalcButton(
                    buttonText: '3',
                    onpress: display,
                  ),
                  CalcButton(
                    buttonColor: Colors.deepPurpleAccent,
                    buttonText: '+',
                    onpress: display,
                  )
                ],
              ),
              Row(
                children: [
                  CalcButton(
                    buttonText: '0',
                    flexValue: 2,
                    onpress: display,
                  ),
                  CalcButton(
                    buttonText: '.',
                    onpress: display,
                  ),
                  CalcButton(
                    buttonText: '=',
                    buttonColor: Colors.orange,
                    onpress: display,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CalcButton extends StatelessWidget {
  final int flexValue;
  final String buttonText;
  final Color buttonColor;
  final Function onpress;

  CalcButton(
      {this.buttonText,
      this.flexValue = 1,
      this.buttonColor = Colors.lightBlue,
      this.onpress});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexValue,
      child: Container(
        padding: EdgeInsets.all(2.0),
        child: MaterialButton(
          elevation: 20.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          padding: EdgeInsets.all(20.0),
          color: buttonColor,
          onPressed: () => onpress(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
