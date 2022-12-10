import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(painter: _LoadingPainter()),
      ),
    );
  }
}

class _LoadingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;
    const rRect = Rect.fromLTWH(-100, -100, 200, 200);
    canvas.drawRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant _) {
    // implement shouldRepaint
    return false;
  }
}
