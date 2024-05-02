import 'package:flutter/material.dart';

class GoogleAdmobNativeAds extends StatefulWidget {
  const GoogleAdmobNativeAds({super.key});

  @override
  State<GoogleAdmobNativeAds> createState() => _GoogleAdmobNativeAdsState();
}

class _GoogleAdmobNativeAdsState extends State<GoogleAdmobNativeAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Ads'),
      ),
    );
  }
}
