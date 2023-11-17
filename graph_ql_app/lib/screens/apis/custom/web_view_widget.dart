import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../controller/api/api_controller.dart';

class WebViewWidgets extends StatelessWidget {
  WebViewWidgets({super.key});

  final ApiController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (controller) => Expanded(
          child: controller.isLoading
              ? Center(
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator()),
                )
              : WebViewWidget(controller: controller.webViewController)),
    );
  }
}
