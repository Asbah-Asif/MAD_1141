import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyFlutterApp());
}

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Lab-01"),
          backgroundColor: CupertinoColors.systemPurple,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home),
                SizedBox(width: 10),
                Text("Row Widget Example"),
              ],
            ),

            SizedBox(height: 20),

            Text("This is Flutter Lab 1"),
            Text("My name is Asbah"),
          ],
        ),
      ),
    );
  }
}
