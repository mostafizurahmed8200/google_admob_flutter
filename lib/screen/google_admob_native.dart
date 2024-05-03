import 'package:flutter/material.dart';
import 'package:google_admob_flutter/constant/constant.dart';
import 'package:google_admob_flutter/model/demo_data_list.dart';

import '../widget/datalist_nativeads.dart';

class GoogleAdmobNativeAds extends StatefulWidget {
  const GoogleAdmobNativeAds({Key? key});

  @override
  State<GoogleAdmobNativeAds> createState() => _GoogleAdmobNativeAdsState();
}

class _GoogleAdmobNativeAdsState extends State<GoogleAdmobNativeAds> {
  late List<DemoDataList> _demoList;

  @override
  void initState() {
    super.initState();
    _demoList = fetchData();
  }

  List<DemoDataList> fetchData() {
    return DemoDataList.data_list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.nativeAdmob),
      ),
      body: ListView.builder(
        itemCount: _demoList.length,
        itemBuilder: (context, index) {
          return DataListView(demoDataList: _demoList[index]);
        },
      ),
    );
  }
}
