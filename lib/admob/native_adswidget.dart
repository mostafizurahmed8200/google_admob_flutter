import 'package:flutter/material.dart';
import 'package:google_admob_flutter/constant/constant.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdWidget extends StatefulWidget {
  const NativeAdWidget({super.key});

  @override
  _NativeAdWidgetState createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  late NativeAd _nativeAd;

  @override
  void initState() {
    super.initState();
    _nativeAd = NativeAd(
      adUnitId: AdsConstant.nativeAdsID,
      // Replace with your own ad unit ID
      request: const AdRequest(),
      factoryId: 'adFactoryExample',
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          print('Native Ad loaded.');
          setState(() {});
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Native Ad failed to load: $error');
          ad.dispose();
        },
      ),
    );
    _nativeAd.load();
  }

  @override
  void dispose() {
    _nativeAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0), // Add margin as needed
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: AdWidget(ad: _nativeAd),
    );
  }
}
