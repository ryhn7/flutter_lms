import 'package:flutter/material.dart';

class WaveNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    const notchWidth = 160.0;
    const notchDepth = 24.0;
    final centerX = size.width / 2;

    path.moveTo(0, 0);
    path.lineTo(centerX - notchWidth / 2, 0);

    // Lekukan halus dan lebar
    path.cubicTo(
      centerX - notchWidth / 4, 0,
      centerX - notchWidth / 4, notchDepth,
      centerX, notchDepth,
    );
    path.cubicTo(
      centerX + notchWidth / 4, notchDepth,
      centerX + notchWidth / 4, 0,
      centerX + notchWidth / 2, 0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

