import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:get/get.dart';

import '../../../controller/nav_bars_controller/nav_bars_controller.dart';

class CircleNavBar extends StatelessWidget {
  CircleNavBar({super.key});
  final NavBarsController controller = Get.put(NavBarsController());
  @override
  Widget build(BuildContext context) {
    return CircularBottomNavigation(
      List.of([
        TabItem(Icons.home, "Home", Colors.blue,
            labelStyle: TextStyle(fontWeight: FontWeight.normal)),
        TabItem(Icons.search, "Search", Colors.orange,
            labelStyle:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        TabItem(Icons.layers, "Reports", Colors.red,
            circleStrokeColor: Colors.black),
        TabItem(Icons.notifications, "Notifications", Colors.cyan),
      ]),
      barBackgroundColor: Colors.indigo,
      selectedPos: controller.selectedPos,
      controller: controller.navigationController,
      selectedCallback: (selectedPos) {
        controller.changePage(selectedPos!);
        log("clicked on $selectedPos");
      },
    );
  }
}
