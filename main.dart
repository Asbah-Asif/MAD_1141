import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                // ================= TASK 1 =================
                Container(
                  width: 250,
                  height: 250,
                  margin: const EdgeInsets.all(25.0),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      "Task 1: Safe Container",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const Divider(thickness: 2),

                // ================= TASK 2 =================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Icon(Icons.favorite, size: 40),
                      SizedBox(height: 60),
                      Icon(Icons.thumb_up, size: 40),
                      Icon(Icons.share, size: 40),
                    ],
                  ),
                ),

                const Divider(thickness: 2),

                // ================= TASK 3 =================
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Icon(Icons.volume_up),
                      SizedBox(width: 20),
                      Icon(Icons.bluetooth),
                      SizedBox(width: 20),
                      Icon(Icons.wifi),
                    ],
                  ),
                ),

                const Divider(thickness: 2),

                // ================= TASK 4 =================
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.blue,
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          color: Colors.red,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}