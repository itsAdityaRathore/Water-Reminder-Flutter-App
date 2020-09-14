import 'package:flutter/material.dart';
import 'package:water_reminder/UI/Resources/constants.dart';

class Cups extends StatefulWidget {
  @override
  _CupsState createState() => _CupsState();
}

int containerSize = 100;

class _CupsState extends State<Cups> {
  double iconsize = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Containers'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          color: containerSize == 100 ? kDeepBlue : kmatteBlack,
                          iconSize: containerSize == 100 ? 60 : 40,
                          onPressed: () {
                            setState(() {
                              containerSize = 100;
                            });
                          },
                        ),
                        Text(
                          "100 ml",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          color: containerSize == 125 ? kDeepBlue : kmatteBlack,
                          iconSize: containerSize == 125 ? 60 : 40,
                          onPressed: () {
                            setState(() {
                              containerSize = 125;
                            });
                          },
                        ),
                        Text(
                          "125 ml",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          color: containerSize == 150 ? kDeepBlue : kmatteBlack,
                          iconSize: containerSize == 150 ? 60 : 40,
                          onPressed: () {
                            setState(() {
                              containerSize = 150;
                            });
                          },
                        ),
                        Text(
                          "150 ml",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          color: containerSize == 175 ? kDeepBlue : kmatteBlack,
                          iconSize: containerSize == 175 ? 60 : 40,
                          onPressed: () {
                            setState(() {
                              containerSize = 175;
                            });
                          },
                        ),
                        Text(
                          "175 ml",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          color: containerSize == 200 ? kDeepBlue : kmatteBlack,
                          iconSize: containerSize == 200 ? 60 : 40,
                          onPressed: () {
                            setState(() {
                              containerSize = 200;
                            });
                          },
                        ),
                        Text(
                          "200 ml",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          color: containerSize == 300 ? kDeepBlue : kmatteBlack,
                          iconSize: containerSize == 300 ? 60 : 40,
                          onPressed: () {
                            setState(() {
                              containerSize = 300;
                            });
                          },
                        ),
                        Text(
                          "300 ml",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          color: containerSize == 400 ? kDeepBlue : kmatteBlack,
                          iconSize: containerSize == 400 ? 60 : 40,
                          onPressed: () {
                            setState(() {
                              containerSize = 400;
                            });
                          },
                        ),
                        Text(
                          "400 ml",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          color: containerSize == 500 ? kDeepBlue : kmatteBlack,
                          iconSize: containerSize == 500 ? 60 : 40,
                          onPressed: () {
                            setState(() {
                              containerSize = 500;
                            });
                          },
                        ),
                        Text(
                          "500 ml",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          color: containerSize == 0 ? kDeepBlue : kmatteBlack,
                          iconSize: containerSize == 0 ? 60 : 40,
                          onPressed: () {
                            setState(() {
                              containerSize = 0;
                            });
                          },
                        ),
                        Text(
                          "custom",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
