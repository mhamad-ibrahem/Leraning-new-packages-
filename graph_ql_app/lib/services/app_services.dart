import 'dart:async';
import 'dart:developer';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppServices extends GetxService {
  late Box box;
  static FlutterBackgroundService service = FlutterBackgroundService();
  Future<AppServices> init() async {
    await Hive.initFlutter();
    MobileAds.instance.initialize();
    box = await Hive.openBox('GraphBox');
    await dotenv.load(fileName: ".env");
    final service = FlutterBackgroundService();
    await service.configure(
        androidConfiguration: AndroidConfiguration(
          onStart: onStart,
          autoStart: true,
          isForegroundMode: true,
        ),
        iosConfiguration: IosConfiguration());
    await service.startService();
    return this;
  }
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
      log("foreground service");
    });
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
      log("Back ground services");
      Timer.periodic(Duration(seconds: 3), (timer) {
        log("timer start");
      });
    });
  }
  //to stop service
  service.on('stopServices').listen((event) {
    service.stopSelf();
  });
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
