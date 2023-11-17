import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../controller/ad_mobs/ad_mobs_controller.dart';

class AddMobsPage extends StatelessWidget {
  AddMobsPage({super.key});
  final AdMobsController controller = Get.put(AdMobsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AdMob",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GetBuilder<AdMobsController>(
        builder: (controller) => Column(
          children: [
            controller.bannerAd != null
                ? Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: controller.bannerAd!.size.width.toDouble(),
                      height: controller.bannerAd!.size.height.toDouble() * 2,
                      child: AdWidget(ad: controller.bannerAd!),
                    ),
                  )
                : const SizedBox(),
            Center(
              child: MaterialButton(
                  onPressed: () => controller.showAdd(),
                  child: const Text("Show Ad")),
            ),
            MaterialButton(
                onPressed: () => controller.showRewardedAd(),
                child: const Text("Show Reward Ad")),
            Text("your points are ${controller.points}")
          ],
        ),
      ),
    );
  }
}
