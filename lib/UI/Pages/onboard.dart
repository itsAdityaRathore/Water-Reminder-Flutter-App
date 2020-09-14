import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  @override
  _OnboardState createState() => _OnboardState();
}

enum Gender { male, female }
Gender selectedGender;

class _OnboardState extends State<Onboard> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        _getPage1(index: 1),
        _getPage2(index: 2),
        _getPage3(index: 3),
      ],
    );
  }

  _getPage1({int index}) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        color: Color(0xFFF2BB25),
        child: Column(
          children: <Widget>[
            _getSkipBtn(),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Image.asset(
                      "assets/male.png",
                    ),
                    iconSize: (selectedGender == Gender.male) ? 180 : 130,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/female.png",
                    ),
                    iconSize: (selectedGender == Gender.female) ? 180 : 130,
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  _getTellGenderText(),
                  SizedBox(
                    height: 80,
                  ),
                  _getPageIndicator(index),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white,), 
                    onPressed: () {
                      setState(() {
                        index -= 1;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white,), 
                    onPressed: () {
                      setState(() {
                        index += 1;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

   _getPage2({int index}) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        color: Color(0xFFF2BB25),
        child: Column(
          children: <Widget>[
            _getSkipBtn(),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/boyweight.png", height: 200,)
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  _getTellGenderText(),
                  SizedBox(
                    height: 80,
                  ),
                  _getPageIndicator(index),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white,), 
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white,), 
                    onPressed: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

   _getPage3({int index}) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        color: Color(0xFFF2BB25),
        child: Column(
          children: <Widget>[
            _getSkipBtn(),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/boyweight.png", height: 200,)
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  _getTellGenderText(),
                  SizedBox(
                    height: 80,
                  ),
                  _getPageIndicator(index),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white,), 
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white,), 
                    onPressed: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getPageIndicator(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: index == 1 ? 16 : 6,
          height: 6,
          decoration: BoxDecoration(
              color: index == 1 ? Colors.white : Colors.white70,
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: index == 2 ? 16 : 6,
          height: 6,
          decoration: BoxDecoration(
              color: index == 2 ? Colors.white : Colors.white70,
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: index == 3 ? 16 : 6,
          height: 6,
          decoration: BoxDecoration(
              color: index == 3 ? Colors.white : Colors.white70,
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _getTellGenderText() {
    return Text(
      "Tell me you\ngender",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  _getSkipBtn() {
    return Expanded(
        child: Container(
      alignment: Alignment.centerRight,
      child: Text(
        "Skip",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ));
  }
}
