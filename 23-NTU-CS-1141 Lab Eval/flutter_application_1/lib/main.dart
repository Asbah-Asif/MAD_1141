import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isDark= false;

  final List<Map<String, String>>schedule=[
    {
      "time":"8:00-9:30 AM",
      "subject":"flutter development",
      "room":"room 201",
    },
    {
      "time":"9:30- 11:00 AM",
      "subject":"Data Structures",
      "room":"room 305",
    },
    {
      "time":"11:30 - 1:00 PM",
      "subject":"Database system",
      "room":"Lab 02",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isDark ? ThemeMode.dark: ThemeMode.light,
      home:ScheduleScreen(
        schedule:schedule,
        isDark:_isDark,
        onToggleTheme: (){
          setState
            ((){
              _isDark=!_isDark;
            });
          },
          ),
    );
  }
}
class ScheduleScreen extends StatelessWidget{
   final List<Map<String, String>>schedule;
   final bool isDark;
   final VoidCallback onToggleTheme;

   const ScheduleScreen({
    super.key,
    required this.schedule,
    required this. isDark,
    required this.onToggleTheme,
   });

   @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("My Schedule"),
        actions: [
          IconButton(onPressed: onToggleTheme, icon: Icon( isDark ? Icons.light_mode: Icons.dark_mode,
          ),
          ),
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: schedule.map((item){
            return Column(
              children: [
                Card(
                  elevation: 4,
                  child: Padding(padding: const EdgeInsets.all(16.0),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item["time"]!,
                      style: const TextStyle( fontSize: 18, fontWeight: FontWeight.bold,
                      ),
                      ),
                      const SizedBox(height:8),

                      Text(item ["subject"]!,
                      style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold,)
                      ),

                      const SizedBox(height:8),

                      Text(item ["room"]!,
                      style: const TextStyle( fontSize: 15,
                      ),
                      ),
                    ],
                      ),
                      ),
                      ),
                    const SizedBox(height: 15),
              ],
            );
          }).toList(),
        ),
        ),
        ),
        );
  }
}