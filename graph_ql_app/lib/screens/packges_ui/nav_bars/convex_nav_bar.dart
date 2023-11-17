import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/nav_bars_controller/nav_bars_controller.dart';

class ConvexNavBar extends StatelessWidget {
  ConvexNavBar({super.key});
  final NavBarsController controller = Get.put(NavBarsController());
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      initialActiveIndex: controller.selectedPos,
      activeColor: Colors.indigo,
      backgroundColor: Colors.black,
      style: TabStyle.textIn,
      height: 50,
      items: [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.map, title: 'Discovery'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.message, title: 'Message'),
      ],
      onTap: (int i) {
        print('click index=$i');
        controller.changePage(i);
      },
    );
  }
}
