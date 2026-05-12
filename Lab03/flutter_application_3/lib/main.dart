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
          title: Text("Lab Plan 3"),
          backgroundColor: Colors.blue,

          // Task 3 → CircleAvatar in AppBar (Asset)
          leading: Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.jpeg"),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //==== TASK 1 ====
              Text("Task 1: Cards with Icons",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Card(
                color: Colors.orange[100],
                elevation: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 30),
                    Icon(Icons.favorite, color: Colors.red, size: 35),
                    Icon(Icons.thumb_up, color: Colors.blue, size: 40),
                  ],
                ),
              ),
              Card(
                color: Colors.green[100],
                elevation: 5,
                child: Column(
                  children: [
                    Icon(Icons.home, color: Colors.green, size: 30),
                    Icon(Icons.settings, color: Colors.black, size: 35),
                    Icon(Icons.security, color: Colors.purple, size: 40),
                  ],
                ),
              ),
              Card(
                color: Colors.blue[100],
                elevation: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.phone, size: 30),
                    Icon(Icons.email, size: 35),
                    Icon(Icons.map, size: 40),
                  ],
                ),
              ),
              Divider(color: Colors.red, thickness: 3),

              // ==== TASK 2 ====
              Text("Task 2: Margin & Padding",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              Container(
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                color: Colors.yellow,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    color: Colors.orange,
                    height: 80,
                    child: Center(child: Text("Spacing Example")),
                  ),
                ),
              ),

              Divider(color: Colors.green, thickness: 3),

              //===== TASK 3 ====
              Text("Task 3: CircleAvatar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              CircleAvatar(
                radius: 40,
                backgroundImage:
                    NetworkImage("https://i.pravatar.cc/150"),
              ),

              SizedBox(height: 10),

              Divider(color: Colors.blue, thickness: 3),

              // ==== TASK 4 ====
              Text("Task 4: Card & ListTile",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Asbah Asif"),
                  subtitle: Text("Reg No: 2021-SE-123"),
                ),
              ),

              Card(
                color: Colors.blue[50],
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: CircleAvatar(child: Text("A")),
                  title: Text("Ali Khan"),
                  subtitle: Text("Reg No: 2021-SE-456"),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),

              Divider(color: Colors.purple, thickness: 3),
            ],
          ),
        ),
      ),
    );
  }
}