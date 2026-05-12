import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => MyState();
}

class MyState extends State<Home> {

  double r = 0;
  double g = 0;
  double b = 0;

  double size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GestureDetector(

            onLongPress: () {
              print("Color changed");
            },

            onHorizontalDragUpdate: (details) {
              setState(() {
                size = size + 5; // simple increase only
              });
            },

            child: Container(
              height: size,
              width: size,
              color: Color.fromRGBO(r.toInt(), g.toInt(), b.toInt(), 1),
            ),
          ),

          Slider(
            value: r,
            min: 0,
            max: 255,
            onChanged: (v) {
              setState(() {
                r = v;
              });
            },
          ),

          Slider(
            value: g,
            min: 0,
            max: 255,
            onChanged: (v) {
              setState(() {
                g = v;
              });
            },
          ),

          Slider(
            value: b,
            min: 0,
            max: 255,
            onChanged: (v) {
              setState(() {
                b = v;
              });
            },
          ),
        ],
      ),
    );
  }
}