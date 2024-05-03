import 'package:flutter/material.dart';

import '../model/demo_data_list.dart';

class DataListView extends StatelessWidget {
  final DemoDataList demoDataList;

  const DataListView({super.key, required this.demoDataList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.green.shade100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
