import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool dark = false; // theme variable

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dark
          ? ThemeData.dark().copyWith(
              appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
            )
          : ThemeData.light().copyWith(
              appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
            ),

      home: Scaffold(
        appBar: AppBar(
          title: Text("Lab-06 Asbah Asif"),
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_6),
              onPressed: () {
                setState(() {
                  dark = !dark; // toggle theme
                });
              },
            )
          ],
        ),

   
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "Hy my name is Asbah Asif, and today i am displaying dark and light theme",
                style: Theme.of(context).textTheme.bodyLarge ?.copyWith(color: Colors.blue),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),

              Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("This is a card"),
                ),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {},
                child: Text("Press Me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
