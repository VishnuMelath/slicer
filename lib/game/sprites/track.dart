import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Track extends CircleComponent {
  Track(
      {required super.position,
      required double radius,
      Color color = Colors.black})
      : super(
            anchor: Anchor.center,
            radius: radius,
            paint: Paint()
              ..color = color
              ..style = PaintingStyle.fill);
}
