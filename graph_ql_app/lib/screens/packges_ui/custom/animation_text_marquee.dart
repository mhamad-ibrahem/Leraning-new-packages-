import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AnimationTextMarquee extends StatelessWidget {
  const AnimationTextMarquee({super.key});

  @override
  Widget build(BuildContext context) {
    return Marquee(
      text: 'Some sample text that takes some space.',
      style: TextStyle(fontWeight: FontWeight.bold),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 30.0, //space between
      velocity: 150.0, //speed of animation && negative number mean reverse
      pauseAfterRound: Duration(seconds: 1),
      startPadding: 10.0,
      accelerationDuration: Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
    );
  }
}
