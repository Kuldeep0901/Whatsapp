import 'dart:math';

import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus(
      {Key? key,
      required this.name,
      required this.time,
      required this.imagename,
      required this.isseen,
      required this.statusnum})
      : super(key: key);
  final String name;
  final String time;
  final String imagename;
  final bool isseen;
  final int statusnum;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: StatusPainter(isseen: isseen, statusnum: statusnum),
        child: const CircleAvatar(
          radius: 26,
          backgroundImage: AssetImage("assets/2.jpeg"),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        time,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}

degreToAngle(double degree) {
  return degree = pi / 180;
}

class StatusPainter extends CustomPainter {
  bool isseen;

  // ignore: prefer_typing_uninitialized_variables
  var statusnum;
  StatusPainter({required this.isseen, this.statusnum});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..color = isseen ? Colors.grey : const Color(0xff21bfa6)
      ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);
  }

  void drawArc(Canvas canvas, Size size, Paint paint) {
    if (statusnum == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreToAngle(0), degreToAngle(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / statusnum;
      for (int i = 0; i < statusnum; i++) {
        canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            degreToAngle(degree + 4), degreToAngle(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
