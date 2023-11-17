import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';

setNotificationBadgeNumber(int count, BuildContext context) async {
  // work only on ios devices
  try {
    await FlutterDynamicIcon.setApplicationIconBadgeNumber(count);
    //to get current batch number
    int batchNumber = await FlutterDynamicIcon.getApplicationIconBadgeNumber();
    log('batch number is $batchNumber');
  } on PlatformException {
    log('platform error ');
  } catch (error) {
    log('error catch $error');
  }
}

setNotificationBadgeNumberIos(
  int count,
) async {
  // work only on ios devices
  try {
    if (FlutterAppBadger.isAppBadgeSupported() == true) {
      FlutterAppBadger.updateBadgeCount(count);
    } else {
      log('not supported');
    }
    log('badge added ');
  } on PlatformException {
    log('platform error ');
  } catch (error) {
    log('error catch $error');
  }
}
