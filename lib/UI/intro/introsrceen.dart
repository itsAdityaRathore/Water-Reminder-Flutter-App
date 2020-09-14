import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_reminder/UI/Pages/home.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

// enum Gender { male, female }

class _IntroScreenState extends State<IntroScreen> {
  String selectedGender;
  int currentWeight=65;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<int> _counter;
  Future<int> _weight;
  Future<String> _gender;
  // Future<DateTime> _wakeupTime;
  // Future<DateTime> _sleepTime;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt("counter", counter).then((bool success) {
        return counter;
      });
    });
  }

  Future<void> _setUserData() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _gender = prefs.setString("gender", selectedGender).then((bool success) {
        return selectedGender;
      });

      _weight = prefs.setInt("weight", currentWeight).then((bool success){
        return currentWeight;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('counter') ?? 0);
    });

    _weight = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('weight'));
    });

    _gender = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('gender'));
    });
  }

  int currentIndex = 0;
  //int currentWeight = 65;

  PageController pageController = new PageController(initialPage: 0);

  Widget pageIndicator(bool isCurrentPage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        children: <Widget>[
          _getPage1(0),
          _getPage2(1),
          _getPage3(2),
          _getPage4(3)
        ],
        physics: BouncingScrollPhysics(),
      ),
      bottomSheet: currentIndex != 3
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[200], Colors.blue[500]],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.blue[300],
              ),
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  currentIndex != 0
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              pageController.animateToPage(currentIndex - 1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.decelerate);
                            });
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Icon(
                          Icons.tag_faces,
                          color: Colors.white,
                        ),
                  Row(
                    children: <Widget>[
                      pageIndicator(currentIndex == 0 ? true : false),
                      SizedBox(
                        width: 10,
                      ),
                      pageIndicator(currentIndex == 1 ? true : false),
                      SizedBox(
                        width: 10,
                      ),
                      pageIndicator(currentIndex == 2 ? true : false),
                      SizedBox(
                        width: 10,
                      ),
                      pageIndicator(currentIndex == 4 ? true : false)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pageController.animateToPage(currentIndex + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInSine);
                      });
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          : GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.green[200], Colors.green],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
                height: 60,
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );

                _setUserData();
                _incrementCounter();
                // new User(gender: selectedGender, weight: currentWeight);
                // UserDatabaseProvider.db.addUserToDatabase(
                //     new User(gender: selectedGender, weight: _currentWeight));
              },
            ),
    );
  }

  _getPage1(int index) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset(
                        "assets/male.png",
                      ),
                      iconSize: (selectedGender == "male") ? 180 : 130,
                      onPressed: () {
                        setState(() {
                          selectedGender = "male";
                        });
                      },
                    ),
                    Text(
                      "Male",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.orange),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset(
                        "assets/female.png",
                      ),
                      iconSize: (selectedGender == "female") ? 180 : 130,
                      onPressed: () {
                        setState(() {
                          selectedGender = "female";
                        });
                      },
                    ),
                    Text(
                      "Female",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Text(
                  "Tell me your\nGender",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      shadows: [
                        Shadow(
                            color: Colors.grey[300],
                            offset: Offset(2, 4),
                            blurRadius: 4)
                      ]),
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //int _currentWeight = 65;

  _getPage2(int index) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/boyweight.png",
                  height: 200,
                ),
                Text(
                  "$currentWeight Kg",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Tell me your\nWeight",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      shadows: [
                        Shadow(
                            color: Colors.grey[300],
                            offset: Offset(2, 4),
                            blurRadius: 4)
                      ]),
                ),
                SizedBox(
                  width: 5,
                ),
                new NumberPicker.integer(
                  highlightSelectedValue: true,
                  infiniteLoop: true,
                  listViewWidth: 50,
                  itemExtent: 60,
                  initialValue: currentWeight,
                  minValue: 10,
                  maxValue: 150,
                  onChanged: (value) {
                    setState(() {
                      currentWeight = value;
                    });
                    print(value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DateTime wakeUpTime;
  DateTime sleepTime;
  String fltbtntxtWake = "Select Time", fltbtntxtSleep = "Select Time";

  _getPage3(int index) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/wakeup.png",
                  height: 200,
                ),
                // Text(
                //   new DateFormat.jm().format(wakeUpTime),
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 30,
                //       color: Colors.blue),
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Text(
                  "What time you\nWake up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      shadows: [
                        Shadow(
                            color: Colors.grey[300],
                            offset: Offset(2, 4),
                            blurRadius: 4)
                      ]),
                ),
                SizedBox(
                  height: 25,
                ),
                FlatButton(
                    color: Colors.amber,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      DatePicker.showTime12hPicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        print('confirm $date');
                        setState(() {
                          print(new DateFormat.jm().format(date));
                          fltbtntxtWake = new DateFormat.jm().format(date);
                          wakeUpTime = date;
                        });
                      }, currentTime: DateTime.now());
                    },
                    child: Text(
                      fltbtntxtWake,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getPage4(int index) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/sleep.png",
                  height: 200,
                ),
                // Text(
                //   new DateFormat.jm().format(wakeUpTime),
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 30,
                //       color: Colors.blue),
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Text(
                  "What time you\nSleep",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      shadows: [
                        Shadow(
                            color: Colors.grey[300],
                            offset: Offset(2, 4),
                            blurRadius: 4)
                      ]),
                ),
                SizedBox(
                  height: 25,
                ),
                FlatButton(
                    color: Colors.amber,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      DatePicker.showTime12hPicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        print('confirm $date');
                        setState(() {
                          print(new DateFormat.jm().format(date));
                          fltbtntxtSleep = new DateFormat.jm().format(date);
                          wakeUpTime = date;
                        });
                      }, currentTime: DateTime.now());
                    },
                    child: Text(
                      fltbtntxtSleep,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
