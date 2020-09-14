import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_reminder/UI/Pages/cups.dart';
import 'package:water_reminder/UI/Resources/constants.dart';
import 'package:water_reminder/UI/Resources/data.dart';
import 'package:water_reminder/UI/intro/clipper.dart';
import 'package:wave_progress_widget/wave_progress.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int counter;

  double _progress = 0;
  int weight;
  String gender;

  int totalWater = 2500;
  int totalIntake = 0;

  double weightPounds;

  calculateIntake(int weight) {
    //print(weight);

    weightPounds = weight * 2.205;
    print(weightPounds);

    totalWater = ((weightPounds * 0.66) * 29.58).toInt();
    print(totalWater);

    setState(() {
      this.totalWater = totalWater;
    });
  }

  Future<void> _setUserData() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      weight = prefs.getInt("weight");
      print("new $weight");
      gender = prefs.getString("gender");
      print("gender $gender");
    });

    calculateIntake(weight);
  }

  @override
  void initState() {
    // TODO: implement initState
    _setUserData();
    print("init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      appBar: AppBar(
        shape: CustomShapeBorder(),
        centerTitle: true,
        title: Text("Water Reminder", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 4),),
        elevation: 10,
      ),
      body: Container(
        child: Stack(children: <Widget>[
          Container(
              color: kBaseWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  // Text(
                  //   "Your Body is ${_progress.round()}% hydrated",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(fontSize: 20),
                  // ),
                  // SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(150.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(1.0, 4.0),
                                  blurRadius: 9.0,
                                  spreadRadius: 0.5)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              WaveProgress(
                                  250.0, Colors.blue, kSkyBlue, _progress),
                              Image(
                                image: AssetImage('assets/human_body.png'),
                                height: 250,
                                color: Color.fromRGBO(255, 255, 255, 0.6),
                              ),
                              Text(
                                "${_progress.round()}%",
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 4 / 10,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(1.0, 4.0),
                              blurRadius: 9.0,
                              spreadRadius: 0.5)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "$totalIntake / $totalWater",
                        style: TextStyle(
                            fontSize: 27,
                            color: kDeepBlue,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono'),
                      ),
                    ),
                  ),
                ],
              )),
          
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _calculateProgress(),
        child: Icon(
          Icons.add_circle,
        ),
      ),
    );
  }

  _calculateProgress() {
    setState(() {
      totalIntake += containerSize;
      _progress = (totalIntake / totalWater) * 100;
    });
  }
}
