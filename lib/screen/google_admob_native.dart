import 'package:flutter/material.dart';
import 'package:google_admob_flutter/model/demo_data_list.dart';

class GoogleAdmobNativeAds extends StatefulWidget {
  const GoogleAdmobNativeAds({super.key});

  @override
  State<GoogleAdmobNativeAds> createState() => _GoogleAdmobNativeAdsState();
}

class _GoogleAdmobNativeAdsState extends State<GoogleAdmobNativeAds> {
  late Future<List<DemoDataList>> demoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    demoList = fetchDataList();
  }

  Future<List<DemoDataList>> fetchDataList() async {
    return await DemoDataList.data_list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Ads'),
      ),
      body: FutureBuilder<List<DemoDataList>>(
        future: demoList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<DemoDataList>? demoList = snapshot.data;
            return ListView.separated(
              itemCount: demoList!.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 70, // Fixed height for each item
                  child: DataListView(demoDataList: demoList[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class DataListView extends StatelessWidget {
  DemoDataList demoDataList;

  DataListView({super.key, required this.demoDataList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.green.shade50,
                  child: Icon(
                    demoDataList.icon,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                demoDataList.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.green.shade50,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.green.shade200,
                )),
          )
        ],
      ),
    );
  }
}
