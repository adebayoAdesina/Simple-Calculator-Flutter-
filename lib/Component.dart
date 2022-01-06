import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String clickedText = '';
  double num1 = 0.0;
  double num2 = 0.0;
  double _Answer = 0;
  String signs = '';

  buttonPress(String buttonText) => {
    if (buttonText == 'CE' ) {
      setState(()=> {
        _Answer = 0,
        num1 = 0,
        num2 = 0,
        // Answer = double.parse(clickedText).eval(clickedText)
        // Answer = double.tryParse(clickedText)?.toDouble()
      })
    } 
    else if (buttonText == '+' || buttonText == '-' || 
      buttonText == 'x' || buttonText == '%' || 
      buttonText == '+/-' || buttonText == '/' || 
      buttonText == '.' || buttonText == '=') 
      {
      setState(()=> {
          num1 = clickedText as double,
          // signs = buttonText
        }
      )
    }
    else if (buttonText == '=') {
        num2 = clickedText as double,
        if (signs == '+') {
          _Answer = (num1 + num2)
        }
      }
    else {
      setState(()=> {
        clickedText = clickedText + buttonText
      })
    }
  };

  Widget createNumPadGray(String buttonText){
    return Expanded(
      child: InkWell(
        onTap: () => buttonPress(buttonText),
        child: Container(              
          decoration: BoxDecoration(
            color: Colors.blueGrey[400],
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(buttonText, style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }

  Widget createNumPadOrange(String buttonText){
    return Expanded(
      child: InkWell(
        onTap: () => buttonPress(buttonText),
        child: Container(         
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(buttonText, style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }

  Widget createNumPadLight(String buttonText){
    return Expanded(
      child: InkWell(
        onTap: () => buttonPress(buttonText),
        child: Container(         
          decoration: BoxDecoration(
            color: Colors.blueGrey[600],
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(buttonText, style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Center(
          child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold),)
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: 
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(clickedText, style: TextStyle(color: Colors.white, fontSize: 25),),
                    )
                )
              ],
            ),
            SizedBox(height: 40,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: 
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_Answer.toString(), style: TextStyle(color: Colors.white, fontSize: 35),),
                    )
                )
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 10),
                createNumPadGray('CE'),
                SizedBox(width: 15),
                createNumPadGray('C'),
                SizedBox(width: 15),
                createNumPadGray('%'),
                SizedBox(width: 15),
                createNumPadOrange('/'),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 10),
                createNumPadLight('7'),
                SizedBox(width: 15),
                createNumPadLight('8'),
                SizedBox(width: 15),
                createNumPadLight('9'),
                SizedBox(width: 15),
                createNumPadOrange('x'),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 10),
                createNumPadLight('4'),
                SizedBox(width: 15),
                createNumPadLight('5'),
                SizedBox(width: 15),
                createNumPadLight('6'),
                SizedBox(width: 15),
                createNumPadOrange('-'),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 10),
                createNumPadLight('1'),
                SizedBox(width: 15),
                createNumPadLight('2'),
                SizedBox(width: 15),
                createNumPadLight('3'),
                SizedBox(width: 15),
                createNumPadOrange('+'),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 10),
                createNumPadLight('0'),
                SizedBox(width: 15),
                createNumPadLight('.'),
                SizedBox(width: 15),
                createNumPadLight('+/-'),
                SizedBox(width: 15),
                createNumPadOrange('='),
                SizedBox(width: 10),
              ],
            )             
          ],
        )
      ),
    );
  }
}