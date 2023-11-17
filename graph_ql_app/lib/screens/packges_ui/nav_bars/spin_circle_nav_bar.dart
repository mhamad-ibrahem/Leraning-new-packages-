import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/controller/nav_bars_controller/nav_bars_controller.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

class SpinCircleNavBar extends StatelessWidget {
  SpinCircleNavBar({super.key});
  final NavBarsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SpinCircleBottomBarHolder(
        bottomNavigationBar: SCBottomBarDetails(
            circleColors: [Colors.white, Colors.orange, Colors.redAccent],
            iconTheme: IconThemeData(color: Colors.black45),
            activeIconTheme: IconThemeData(color: Colors.orange),
            backgroundColor: Colors.white,
            titleStyle: TextStyle(color: Colors.black45, fontSize: 12),
            activeTitleStyle: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            actionButtonDetails: SCActionButtonDetails(
                color: Colors.redAccent,
                icon: Icon(
                  Icons.expand_less,
                  color: Colors.white,
                ),
                elevation: 2),
            elevation: 2.0,
            items: [
              // Suggested count : 4
              SCBottomBarItem(
                  icon: Icons.verified_user,
                  title: "User",
                  onPressed: () {
                    controller.changePage(0);
                  }),
              SCBottomBarItem(
                  icon: Icons.supervised_user_circle,
                  title: "Details",
                  onPressed: () {
                    controller.changePage(1);
                  }),
              SCBottomBarItem(
                  icon: Icons.notifications,
                  title: "Notifications",
                  onPressed: () {
                    controller.changePage(2);
                  }),
              SCBottomBarItem(
                  icon: Icons.details,
                  title: "New Data",
                  onPressed: () {
                    controller.changePage(3);
                  }),
            ],
            circleItems: [
              SCItem(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Get.snackbar("Change", "Add test",
                        backgroundColor: Colors.white);
                  }),
              SCItem(
                  icon: Icon(Icons.print),
                  onPressed: () {
                    Get.snackbar("Change", "print test",
                        backgroundColor: Colors.white);
                  }),
              SCItem(
                  icon: Icon(Icons.map),
                  onPressed: () {
                    Get.snackbar("Change", "map test",
                        backgroundColor: Colors.white);
                  }),
            ],
            bnbHeight: 80 // Suggested Height 80
            ),
        child: controller.displayPage);
  }
}
