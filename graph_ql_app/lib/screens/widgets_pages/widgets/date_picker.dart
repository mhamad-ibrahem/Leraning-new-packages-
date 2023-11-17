import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/controller/ui/ui_controller.dart';

class DatePickerWidget extends StatelessWidget {
  DatePickerWidget({super.key});
  final UiController controller = Get.put(UiController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UiController>(
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.chooseDate(showDatePicker(
              context: context,
              initialDate: controller.time,
              firstDate: DateTime(1900),
              lastDate: DateTime.now()));
        },
        child: TextFormField(
          controller: controller.dateController,
          enabled: false,
          decoration: InputDecoration(
            suffix: Icon(Icons.date_range),
          ),
        ),
      ),
    );
  }
}
