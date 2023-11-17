import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/controller/nav_bars_controller/nav_bars_controller.dart';

import 'custom/animation_text_marquee.dart';
import 'custom/drop_down_search.dart';
import 'custom/straged_grid_view.dart';
import 'nav_bars/circle_nav_bar.dart';
import 'nav_bars/convex_nav_bar.dart';
import 'nav_bars/spin_circle_nav_bar.dart';

class PackagesUi extends StatelessWidget {
  PackagesUi({super.key});
  final NavBarsController controller = Get.put(NavBarsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<NavBarsController>(
        builder: (controller) => Scaffold(
          // bottomNavigationBar: CircleNavBar(),
          bottomNavigationBar: SpinCircleNavBar(),
          // body: controller.displayPage
          body: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(height: 40, child: AnimationTextMarquee()),
              StaggeredGridViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
