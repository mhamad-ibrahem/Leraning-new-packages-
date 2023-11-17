import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/controller/logic/system.dart';
import 'package:graph_ql_app/screens/system/widgets/custom_chart_widget.dart';
import 'package:graph_ql_app/screens/system/widgets/file_picker_widget.dart';

import 'widgets/add_notification_button.dart';

class SystemWidgets extends StatelessWidget {
  SystemWidgets({super.key});
  final SystemController controller = Get.put(SystemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SystemController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              FilePickerWidget(),
              AddNotificationButton(),
              CustomChartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
