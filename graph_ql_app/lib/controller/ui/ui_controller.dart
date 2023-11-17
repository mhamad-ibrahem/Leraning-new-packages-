import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/core/helper/app_helper.dart';

class UiController extends GetxController {
  String? selectedValue;
  DateTime time = DateTime.now();
  final TextEditingController dateController = TextEditingController();
  selectValue(String val) {
    selectedValue = val;
    var value = ApplicationHelper.difference(time);
    log(value);
    update();
  }

  @override
  void onInit() {
    dateController.text = "${time.day}/${time.month}/${time.year}/";
    super.onInit();
  }

  chooseDate(Future<DateTime?> datePicker) async {
    DateTime? newDate = await datePicker;
    if (newDate != null) {
      time = newDate;
      dateController.text = "${time.day}/${time.month}/${time.year}/";
      update();
    } else {
      dateController.text = "${time.day}/${time.month}/${time.year}/";
      update();
    }
  }
}
