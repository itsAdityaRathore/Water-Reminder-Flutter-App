import 'package:flutter/material.dart';
import 'package:water_reminder/UI/Resources/theme.dart';


class MyTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 120.0,
      ),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, size.height * 0.85);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.50, size.width * 0.17 , size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.24, size.height * 0.99, size.width * 0.30 , size.height * 0.99);
    path.quadraticBezierTo(size.width * 0.19, size.height * 0.18, size.width * 0.70 , size.height * 0.90);
    path.quadraticBezierTo(size.width * 0.83, size.height * 0.75, size.width * 0.90 , size.height * 0.26);
    path.quadraticBezierTo(size.width * 0.88, size.height * 0.05, size.width , size.height * 0.25);   
    path.lineTo(size.width , 0);
    path.close();

    paint.color = colorthree;
    canvas.drawPath(path, paint);

    Path path1 = Path();

    path1.lineTo(0, size.height * 0.23);
    path1.quadraticBezierTo(size.width * 0.15, size.height * 0.10, size.width * 0.25 , size.height * 0.25);
    path1.quadraticBezierTo(size.width * 0.35, size.height * 0.38, size.width * 0.45 , size.height * 0.23);
    path1.quadraticBezierTo(size.width * 0.52, size.height * 0.1, size.width * 0.62 , size.height * 0.20);
    path1.quadraticBezierTo(size.width * 0.78, size.height * 0.40, size.width * 0.85 , size.height * 0.26);
    path1.quadraticBezierTo(size.width * 0.93, size.height * 0.05, size.width , size.height * 0.25);   
    path1.lineTo(size.width , 0);
    path1.close();

    paint.color = colortwo;
    canvas.drawPath(path1, paint);

    path = Path();


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    throw UnimplementedError();
  } 
}

