import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/api/api_controller.dart';
import 'custom/web_view_widget.dart';

class ApiScreens extends StatelessWidget {
  ApiScreens({super.key});
  final ApiController controller = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [WebViewWidgets()],
      ),
    );
  }
}
