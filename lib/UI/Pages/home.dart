import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_reminder/UI/Pages/cups.dart';
import 'package:water_reminder/UI/Pages/dashboard.dart';
import 'package:water_reminder/UI/Pages/insights.dart';
import 'package:water_reminder/UI/Pages/profile.dart';
import 'package:water_reminder/UI/Resources/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<Widget> pageList = List<Widget>();


  @override
  void initState() {
    pageList.add(Dashboard());
    pageList.add(Cups());
    pageList.add(Insights());
    pageList.add(Profile());
    super.initState();
  }

  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentTab, children: pageList),
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(
            Icons.home,
            color: kBaseWhite,
            size: 30,
          ),
          Icon(
            Icons.free_breakfast,
            color: kBaseWhite,
            size: 30,
          ),
          Icon(
            Icons.assessment,
            color: kBaseWhite,
            size: 30,
          ),
          Icon(
            Icons.person_pin,
            color: kBaseWhite,
            size: 30,
          ),
        ],
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.blueAccent,
        color: Colors.blue[300],
        height: 60,
        index: currentTab,
        onTap: (index) {
          debugPrint("Current index is $index");
          setState(() {
            currentTab = index;
          });
        },
      ),
    );
  }
}
