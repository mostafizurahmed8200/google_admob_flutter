import 'package:flutter/material.dart';
import 'package:google_admob_flutter/constant/constant.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'google_admob_native.dart';

class GoogleAdmobHomepage extends StatefulWidget {
  const GoogleAdmobHomepage({super.key});

  @override
  State<GoogleAdmobHomepage> createState() => _GoogleAdmobHomepageState();
}

class _GoogleAdmobHomepageState extends State<GoogleAdmobHomepage> {
  late BannerAd _bannerAd;
  late InterstitialAd _interstitialAd;
  String isShowBannerAds = "true";
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadBannerAds();
    _insAdsLoad();
  }

  Future<void> _loadBannerAds() async {
    _bannerAd = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: AdsConstant.bannerAdsID,
      listener: const BannerAdListener(),
      request: const AdRequest(),
    )..load();
  }

  Future<void> _insAdsLoad() async {
    InterstitialAd.load(
      adUnitId: AdsConstant.interstitialAdsID,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _bannerAd.dispose();
    _interstitialAd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Admob '),
      ),
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
                    setState(
                      () {
                        count++;
                        if ((isShowBannerAds != 'true')) {
                          _navigateToNextScreen();
                        } else {
                          _showInterstitialAd(count);
                          print('count---> $count');
                        }

                        if (count == 5) {
                          count = 0;
                        }
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    enableFeedback: true,
                    shadowColor: Colors.lightGreenAccent,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Show Interstitial Ads',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  count.toString(),
                  style: const TextStyle(fontSize: 20),
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

  void _showInterstitialAd(int count) {
    if (_interstitialAd.responseInfo != null && count % 5 == 0) {
      _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          _navigateToNextScreen();
        },
      );
      _interstitialAd.show();
    } else {
      // Navigate to the next screen directly if the count is not divisible by 5 or if the ad fails to load
      _navigateToNextScreen();
      print('Interstitial ad not ready yet.');
    }
  }

  void _navigateToNextScreen() {
    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GoogleAdmobNativeAds()),
    );
  }
}
