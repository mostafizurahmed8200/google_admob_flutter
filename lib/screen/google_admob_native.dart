import 'package:flutter/material.dart';
import 'package:google_admob_flutter/model/demo_data_list.dart';

import '../widget/datalist_nativeads.dart';

class GoogleAdmobNativeAds extends StatefulWidget {
  const GoogleAdmobNativeAds({Key? key});

  @override
  State<GoogleAdmobNativeAds> createState() => _GoogleAdmobNativeAdsState();
}

class _GoogleAdmobNativeAdsState extends State<GoogleAdmobNativeAds> {
  late List<DemoDataList> _demoList;
  late ScrollController _scrollController;
  bool _isLoading = false;
  bool _hasMoreData = true;
  final int _batchSize = 14;

  @override
  void initState() {
    super.initState();
    _demoList = [];
    _scrollController = ScrollController()..addListener(_scrollListener);
    _loadInitialData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (!_isLoading && _hasMoreData && _isEndOfList()) {
      _loadMoreData();
    }
  }

  bool _isEndOfList() {
    return _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent;
  }

  Future<void> _loadInitialData() async {
    await _loadData(0, _batchSize);
  }

  Future<void> _loadMoreData() async {
    await _loadData(_demoList.length, _batchSize);
  }

  Future<void> _loadData(int startIndex, int batchSize) async {
    setState(() {
      _isLoading = true;
    });
    // Simulate loading delay
    await Future.delayed(
      const Duration(seconds: 1),
    );
    // Example: Load data from an API or other source
    List<DemoDataList> newData =
        DemoDataList.data_list.sublist(startIndex, startIndex + batchSize);
    setState(
      () {
        _demoList.addAll(newData);
        _isLoading = false;
        _hasMoreData = _demoList.length < DemoDataList.data_list.length;
        if (!_hasMoreData) {
          // All data has been loaded
          _scrollController.removeListener(_scrollListener);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Ads'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _demoList.length + (_hasMoreData ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _demoList.length) {
            return SizedBox(
              height: 70, // Fixed height for each item
              child: DataListView(demoDataList: _demoList[index]),
            );
          } else if (_hasMoreData) {
            return _buildLoadingIndicator();
          } else {
            return const SizedBox(); // Return an empty container when all data is loaded
          }
        },
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      ),
    );
  }
}
