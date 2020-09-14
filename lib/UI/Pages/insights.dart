import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Insights extends StatefulWidget {
  @override
  _InsightsState createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'),
      ),
      body: Column(
        children: <Widget>[
          LineChart(
            LineChartData(
              // read about it in the below section
              // axisTitleData: 
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('assets/stars.png', scale: 4,),
              Image.asset('assets/stars.png', scale: 4,),
              Image.asset('assets/stars.png', scale: 4,),
              Image.asset('assets/stars.png', scale: 4,),
              Image.asset('assets/stars.png', scale: 4,),
              Image.asset('assets/stars.png', scale: 4,),
              Image.asset('assets/stars.png', scale: 4,),
            ],
          ),
          
        ],
      ),
    );
  }
}
