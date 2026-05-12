import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => MyState();
}
class MyState extends State<MyApp> {
  Color color=Colors.blue;
  double radius=0;
 @override
 Widget build(BuildContext context){
  return Scaffold(
    body:Center(
      child: GestureDetector(
        onTap: (){
          setState(() {
             color=Colors.green;
          });
        },
        onDoubleTap: (){
          setState(() {
            radius=100;
          });
        },
        onLongPress: (){
          setState(() {
            color=Colors.blue;
            radius=0;
          });
        },
        child: Container(
  height: 200,
  width: 200,
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
  ),
),
      ),
    ),
  );
 }
  
}