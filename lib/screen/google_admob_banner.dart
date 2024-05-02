import 'package:flutter/material.dart';
import 'package:google_admob_flutter/constant/constant.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAdmobHomepage extends StatefulWidget {
  const GoogleAdmobHomepage({super.key});

  @override
  State<GoogleAdmobHomepage> createState() => _GoogleAdmobHomepageState();
}

class _GoogleAdmobHomepageState extends State<GoogleAdmobHomepage> {
  late BannerAd _bannerAd;
  String isShowBannerAds = "true";
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bannerAd = BannerAd(
        size: AdSize.largeBanner,
        adUnitId: AdsConstant.bannerAdsID,
        listener: const BannerAdListener(),
        request: const AdRequest())
      ..load();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'In 5 click button show interstitial ads',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: const Text(
                    'Show Interstitial Ads',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  count.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child:
                  (isShowBannerAds == 'true') ? AdWidget(ad: _bannerAd) : null,
            ),
          ),
        ],
      ),
    );
  }
}
