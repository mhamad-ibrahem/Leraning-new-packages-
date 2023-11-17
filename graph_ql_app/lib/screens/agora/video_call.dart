import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/screens/agora/widget/button_row.dart';

import '../../controller/agora_controller.dart';

class VideoCall extends StatelessWidget {
  VideoCall({super.key});
  final AgoraController controller = Get.put(AgoraController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgoraController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  controller.enablePanel();
                },
                icon: Icon(Icons.info))
          ],
        ),
        body: Center(
          child: Stack(
            children: [
              viewRows(),
              panel(),
              Center(child: toolBar()),
            ],
          ),
        ),
      ),
    );
  }
}
