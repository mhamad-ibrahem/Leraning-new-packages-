import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/screens/apis/api_screen.dart';
import 'package:graph_ql_app/screens/payment/patment_page.dart';
import 'package:graph_ql_app/screens/system/system_screens.dart';

import '../../screens/packges_ui/custom/drop_down_search.dart';

class NavBarsController extends GetxController {
  int selectedPos = 0;
  Widget displayPage = DropDownSearchWidget();
  late CircularBottomNavigationController navigationController;
  List<TabItem<Object>> tabItems = [
    TabItem(
      title: "Home",
      activeIcon: Colors.blue,
      icon: Icons.home,
    ),
    TabItem(
      title: "Search",
      activeIcon: Colors.orange,
      icon: Icons.search,
    ),
    TabItem(
      title: "Reports",
      activeIcon: Colors.red,
      icon: Icons.layers,
    ),
    TabItem(
      title: "Notifications",
      activeIcon: Colors.cyan,
      icon: Icons.notifications,
    ),
  ];
  changePage(int selectedPage) {
    selectedPos = selectedPage;
    update();
    if (selectedPos == 0) {
      displayPage = DropDownSearchWidget();
    } else if (selectedPos == 1) {
      displayPage = PaymentPage();
    } else if (selectedPos == 2) {
      displayPage = SystemWidgets();
    } else {
      displayPage = ApiScreens();
    }
  }

  @override
  void onInit() {
    navigationController = CircularBottomNavigationController(selectedPos);
    super.onInit();
  }
}
