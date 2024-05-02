import 'package:flutter/material.dart';

import '../model/demo_data_list.dart';

class DataListView extends StatelessWidget {
  final DemoDataList demoDataList;

  const DataListView({super.key, required this.demoDataList});

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
                width: 20,
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
