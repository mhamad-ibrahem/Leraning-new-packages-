import 'package:flutter/material.dart';
import 'package:graph_ql_app/screens/widgets_pages/widgets/auto_complete_widget.dart';
import 'package:graph_ql_app/screens/widgets_pages/widgets/date_picker.dart';

class WidgetLearning extends StatelessWidget {
  const WidgetLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            DatePickerWidget(),
          ],
        ),
      ),
    );
  }
}
