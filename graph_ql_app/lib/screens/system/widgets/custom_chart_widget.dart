import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/logic/system.dart';

class CustomChartWidget extends StatelessWidget {
  CustomChartWidget({super.key});
  final SystemController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('custom chart'),
          SizedBox(
            height: 40,
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Text('custom s'),
          //       SizedBox(
          //         height: 100,
          //       ),
          //       Text('custom chart'),
          //       SizedBox(
          //         height: 100,
          //       ),
          //       Text('custom chart'),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: controller.days.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  controller.changeSelectedChart(controller.days[index]);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedContainer(
                      margin: EdgeInsets.only(right: 10, bottom: 10),
                      height: controller.days[index] == controller.selectedChart
                          ? controller.days[index].money
                          : 10,
                      width: 40,
                      decoration: BoxDecoration(
                          color:
                              controller.days[index] == controller.selectedChart
                                  ? Colors.amber
                                  : Colors.grey[400],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3))),
                      duration: Duration(seconds: 1),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Text(
                        controller.days[index].name,
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
        //   )
        // ],
      ),
    );
  }
}
