import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graph_ql_app/controller/logic/system.dart';

class FilePickerWidget extends StatelessWidget {
  FilePickerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemController>(
      builder: (controller) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              onPressed: () {
                controller.chooseFile();
              },
              color: Colors.red,
              child: Text(
                'Choose File',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          if (controller.files.isNotEmpty)
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                itemCount: controller.files.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Image.file(controller.files[index]),
                      Center(
                        child: IconButton(
                            onPressed: () {
                              controller.cropImage(
                                  context, controller.files[index]);
                            },
                            icon: Icon(
                              Icons.crop,
                              size: 40,
                              color: Colors.white,
                            )),
                      )
                    ],
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
