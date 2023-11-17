import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ExpandButtonWidget extends StatelessWidget {
  const ExpandButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      // activeBackgroundColor: Colors.indigo,
      icon: Icons.menu,
      activeIcon: Icons.close,
      spacing: 3,
      backgroundColor: Colors.indigo,
      direction: SpeedDialDirection.up,
      // animatedIcon: AnimatedIcons.close_menu,
      animationCurve: Curves.bounceIn,
      children: [
        SpeedDialChild(
            backgroundColor: Colors.black,
            onTap: () {
              log("share");
            },
            child: Icon(
              Icons.share,
              color: Colors.white,
            )),
        SpeedDialChild(
            backgroundColor: Colors.black,
            onTap: () {
              log("download");
            },
            child: Icon(
              Icons.download,
              color: Colors.white,
            )),
        SpeedDialChild(
            backgroundColor: Colors.black,
            onTap: () {
              log("message");
            },
            child: Icon(
              Icons.message,
              color: Colors.white,
            )),
      ],
    );
  }
}
