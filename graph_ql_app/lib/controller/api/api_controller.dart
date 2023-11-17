import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ApiController extends GetxController {
  bool isLoading = false;
  WebViewController webViewController = WebViewController();
  @override
  void onInit() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            isLoading = true;
            update();
            Future.delayed(Duration(seconds: 1), () {
              isLoading = false;
              update();
            });
            log('One Progress=============== first function start');
          },
          onPageStarted: (String url) {
            isLoading = true;
            update();
            log('Page Started===============second function start');
          },
          onPageFinished: (String url) {
            isLoading = false;
            update();
            log('Page Finished=============== third function start');
          },
          onWebResourceError: (WebResourceError error) {
            isLoading = false;
            update();
            log('Page error=============== third function start');
          },
          onNavigationRequest: (NavigationRequest request) {
            log('Page Naviagte request===============');
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://myportfolio-aunt.surge.sh/'));
    super.onInit();
  }
}
