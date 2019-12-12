import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as Math;

class Mypainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = Math.min(size.width, size.height) / 2;
    final center  = Offset(size.width / 2, size.height / 2);

    final faceColor = Paint()..color = Colors.yellow[700];
    final smilePaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 13;
    smilePaint.strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, faceColor);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius / 1.5), 0, Math.pi, false, smilePaint);
    canvas.drawCircle(Offset(center
    .dx -  radius / 3, center.dy  - radius / 2), 17, Paint());
    canvas.drawCircle(Offset(center
    .dx +  radius / 3, center.dy  - radius / 2), 17, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}

class NoiceBox extends CustomPainter {

  final double x_axis;

  NoiceBox({this.x_axis});

  @override
  void paint(Canvas canvas, Size size) {
    /*Math.Random random = Math.Random();
    Timer.periodic(Duration(seconds: 12), (_){
      final points = Offset(random.nextDouble() * width, random.nextDouble() * heigth);

      final paint = Paint()..color = Colors.black;
      paint.strokeWidth = 1.5;

      canvas.drawPoints(PointMode.points, [points], paint);
      _.cancel();
    });*/

    final diagonalLine  = Path();
    final paint = Paint(); 
    diagonalLine.moveTo(0, 5);
    diagonalLine.lineTo(50, 5);
    diagonalLine.lineTo(100, 80);
    diagonalLine.lineTo(0, 80);
    diagonalLine.lineTo(0, 5);

    canvas.drawCircle(Offset(x_axis, size.height / 2), 20, Paint());
    


    paint..style = PaintingStyle.fill;
    paint.color = Colors.white;

    canvas.drawPath(diagonalLine, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}