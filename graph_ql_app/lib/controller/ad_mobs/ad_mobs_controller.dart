import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../core/helper/app_helper.dart';

class AdMobsController extends GetxController {
  BannerAd? bannerAd;
  RewardedAd? rewardedAd;
  int points = 0;
  showAdd() async {
    await BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, err) {
          log('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
    await Future.delayed(const Duration(seconds: 6));
    update();
    log("$bannerAd");
  }

  createRewardedAd() async {
    await RewardedAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/5224354917',
        request: const AdRequest(
          keywords: <String>['foo', 'bar'],
          contentUrl: 'http://foo.com/bar.html',
          nonPersonalizedAds: true,
        ),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            log("Test================== $ad");
            rewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            createRewardedAd();
          },
        ));
  }

  void showRewardedAd() async {
    if (rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      await createRewardedAd();
    }
    rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createRewardedAd();
      },
    );

    rewardedAd!.setImmersiveMode(true);
    rewardedAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      log('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
      points = points + reward.amount.round();
      update();
    });
    rewardedAd = null;
    update();
  }

  @override
  void onReady() async {
    await createRewardedAd();
    super.onInit();
  }

  @override
  void dispose() {
    rewardedAd!.dispose();
    bannerAd!.dispose();
    super.dispose();
  }
}
