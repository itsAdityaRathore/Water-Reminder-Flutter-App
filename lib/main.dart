import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_reminder/UI/intro/introsrceen.dart';

import 'UI/Pages/home.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {

//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   int counter=0;

//   Future<void> _introData() async {
//     final SharedPreferences prefs = await _prefs;
//       counter = prefs.getInt("counter");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: IntroScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int counter = 0;

  Future<void> _introData() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
            counter = prefs.getInt("counter");
            if(counter != null){
              counter = 1;
            }else 
              counter = 0;
    });
  }

  @override
  void initState() {
    _introData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: counter == 0 ? IntroScreen() : Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}