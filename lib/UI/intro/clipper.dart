import 'package:flutter/material.dart';

class ClipperCurve extends StatefulWidget {
  @override
  _ClipperCurveState createState() => _ClipperCurveState();
}

class _ClipperCurveState extends State<ClipperCurve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Container(
                height: MediaQuery.of(context).size.height  * 7/10,
                color: Colors.blue.withOpacity(0.5),
              ),
          ),
          
          ClipPath(
            clipper: GreenClipper(),
            child: Container(
              color: Colors.lightGreenAccent.withOpacity(0.7),
            ),
          ),
        ],
      ),
    ));
  }
}

class GreenClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height / 7 - 10);
    var firstControlPoint = new Offset(size.width / 4, size.height / 6 - 65);
    var firstEndPoint = new Offset(size.width / 2, size.height / 4 - 80 );
    var secondControlPoint =
        new Offset(size.width - (size.width / 5), size.height / 5);
    var secondEndPoint = new Offset(size.width, size.height / 7 - 10);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return null;
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {

    final double innerCircleRadius = 100.0;

    Path path = Path();
    path.lineTo(0, rect.height);
    path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 25, rect.height + 50, rect.width / 2 - 75, rect.height + 50);
    path.cubicTo(
        rect.width / 2 - 40, rect.height + innerCircleRadius - 40,
        rect.width / 2 + 40, rect.height + innerCircleRadius - 40,
        rect.width / 2 + 75, rect.height + 50
    );
    path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 25, rect.height + 50, rect.width, rect.height);
    path.lineTo(rect.width, 0.0);
    path.close();

    return path;
  }
}
