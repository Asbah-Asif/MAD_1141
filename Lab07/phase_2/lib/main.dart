import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => MyState();
}

class MyState extends State<Home> {

  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text("Value = $value"),

          Slider(
            value: value,
            min: 0,
            max: 100,
            onChanged: (v) {
              setState(() {
                value = v;
              });
            },
          ),

          CupertinoSlider(
            value: value,
            min: 0,
            max: 100,
            onChanged: (v) {
              setState(() {
                value = v;
              });
            },
          ),
        ],
      ),
    );
  }
}