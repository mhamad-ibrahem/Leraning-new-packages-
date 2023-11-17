import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/controller/start_controller.dart';

class StartPage extends StatelessWidget {
  StartPage({super.key});
  final StartController controller = Get.put(StartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<StartController>(
        builder: (controller) => Column(children: [
          SizedBox(
            height: 100,
          ),
          TextFormField(
            controller: controller.name,
          ),
          SizedBox(
            height: 20,
          ),
          RadioListTile(
              value: ClientRole.Broadcaster,
              title: Text("Broad Cast"),
              groupValue: controller.clientRole,
              onChanged: (ClientRole? value) {
                controller.activateBroadCastRole(value!);
              }),
          RadioListTile(
              title: Text("Audience"),
              value: ClientRole.Audience,
              groupValue: controller.clientRole,
              onChanged: (ClientRole? value) {
                controller.activateAudienceRole(value!);
              }),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              controller.onJoin();
            },
            child: Text(
              "Start",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            color: Colors.blue,
          )
        ]),
      ),
    );
  }
}
