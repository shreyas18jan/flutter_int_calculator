import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Calculator App',
      theme: new ThemeData(
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String calculatedOutput = "0";
  String _calculatedOutput = "0";
  int num1 = 0;
  int num2 = 0;
  String operator = "";

  buttonPressed(String buttonText){

    if (buttonText == "AC") {
      num1 = 0;
      num2 = 0;
      operator = "";
      _calculatedOutput = "0";
      Toast.show("Clear Button is clicked!!!", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    } else if ( buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*") {
      if(buttonText == "/"){
        Toast.show("We are using round() method for INT type!!!", context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
      }
      num1 = int.parse(calculatedOutput);
      operator = buttonText;
      _calculatedOutput = "0";
    } else if (buttonText == "=") {
      num2 = int.parse(calculatedOutput);

      if (operator == "+") {
        _calculatedOutput = (num1 + num2).toString();
      }
      if (operator == "-") {
        _calculatedOutput = (num1 - num2).toString();
      }
      if (operator == "/") {
        if(num1 == 0 || num2 == 0){
          Toast.show("No Zero as Numerator or Denominator!!!", context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
          return;
        }
        _calculatedOutput = ((num1 / num2).round()).toString();
      }
      if (operator == "*") {
        _calculatedOutput = (num1 * num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operator="";
    } else {
      if(_calculatedOutput == "0"){
        _calculatedOutput = buttonText;
      } else {
        _calculatedOutput = _calculatedOutput + buttonText;
      }
    }

    // Assign at the end
    setState(() {
      calculatedOutput = _calculatedOutput;
    });
  }

  Widget getButton(String buttonText) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: new FloatingActionButton(
        backgroundColor: Colors.black54,
        onPressed: () => buttonPressed(buttonText),
        child: new Text(buttonText, style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black54,
        title: new Text('Flutter Demo : Simple Int Calculator'),
      ),
      body: Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0
              ),
              child: new Text(calculatedOutput, style: new TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            new Expanded(child: new Divider(
              color: Colors.black,
              height: 20,
              thickness: 5,
              indent: 0,
              endIndent: 0,
            )),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getButton("1"),
                getButton("2"),
                getButton("3"),
                getButton("+"),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getButton("4"),
                getButton("5"),
                getButton("6"),
                getButton("-"),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getButton("7"),
                getButton("8"),
                getButton("9"),
                getButton("*"),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getButton("AC"),
                getButton("0"),
                getButton("="),
                getButton("/"),
              ],
            ),
          ],
        ),
      ),

    );
  }

}