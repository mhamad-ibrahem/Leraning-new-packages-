import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/controller/agora_controller.dart';

import 'package:agora_rtc_engine/rtc_local_view.dart' as localView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as remoteView;

final AgoraController controller = Get.put(AgoraController());
Widget viewRows() {
  final List<StatefulWidget> widgetList = [];
  if (controller.clientRole == ClientRole.Broadcaster) {
    widgetList.add(localView.SurfaceView());
  }
  for (var uid in controller.users) {
    widgetList.add(
        remoteView.SurfaceView(uid: uid, channelId: controller.channelName));
  }
  final views = widgetList;
  return Column(
    children: List.generate(
        widgetList.length, (index) => Expanded(child: views[index])),
  );
}

Widget toolBar() {
  if (controller.clientRole == ClientRole.Audience) return SizedBox();
  return Container(
    alignment: Alignment.bottomCenter,
    padding: EdgeInsets.symmetric(vertical: 48),
    child: Row(children: [
      RawMaterialButton(
        onPressed: () {
          controller.muteVoice();
        },
        child: Icon(
          controller.muted ? Icons.mic_off : Icons.mic,
          color: controller.muted ? Colors.white : Colors.blue,
        ),
        shape: CircleBorder(),
        elevation: 2,
        fillColor: controller.muted ? Colors.blue : Colors.white,
        padding: EdgeInsets.all(12),
      ),
      RawMaterialButton(
        onPressed: () {
          Get.back();
        },
        child: Icon(
          Icons.call_end,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        elevation: 2,
        fillColor: Colors.red,
        padding: EdgeInsets.all(15),
      ),
      RawMaterialButton(
        onPressed: () {
          controller.engine.switchCamera();
        },
        child: Icon(
          Icons.switch_camera,
          color: Colors.blue,
        ),
        shape: CircleBorder(),
        elevation: 2,
        fillColor: Colors.white,
        padding: EdgeInsets.all(12),
      )
    ]),
  );
}

Widget panel() {
  return Visibility(
      visible: controller.viewPanel,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 48),
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
            heightFactor: 0.5,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 48),
              child: ListView.builder(
                  itemCount: controller.infoString.length,
                  itemBuilder: ((context, index) {
                    if (controller.infoString.isEmpty) return Text('Empty');
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                              child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              controller.infoString[index],
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey.shade500),
                            ),
                          ))
                        ],
                      ),
                    );
                  })),
            )),
      ));
}
