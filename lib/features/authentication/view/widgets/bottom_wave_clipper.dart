import 'package:flutter/material.dart';

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 4,
      size.height - 80,
      size.width / 2,
      size.height - 50,
    );
    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height - 20,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
