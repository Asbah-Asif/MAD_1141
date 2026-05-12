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
        body: SafeArea(
          child: Center(
            child:Align(
            alignment:Alignment.topCenter,  
            child: Column(
              mainAxisSize: MainAxisSize.min,  
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [ 
                    Expanded(flex: 2,
                      child: 
                    Container(
                      child: Text("ASBAH"),
                      color: Colors.red,
                    ),
                    ),
                    Expanded( flex: 1,
                      child: 
                    Container(
                        child: Text("ESHA"),
                        color: Colors.orange,
                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),
                ),

                Text(
                  "Asbah Asif",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}