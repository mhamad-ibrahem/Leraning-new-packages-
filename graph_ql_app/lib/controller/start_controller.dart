import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../screens/agora/video_call.dart';

class StartController extends GetxController {
  final TextEditingController name = TextEditingController();
  ClientRole clientRole = ClientRole.Broadcaster;

  activateBroadCastRole(ClientRole value) {
    clientRole = value;
    update();
  }

  activateAudienceRole(ClientRole value) {
    clientRole = value;
    update();
  }

  Future<void> onJoin() async {
    await Permission.camera.request();
    await Permission.microphone.request();
    Get.to(() => VideoCall(),
        arguments: {"name": name.text, "role": clientRole});
  }
}
