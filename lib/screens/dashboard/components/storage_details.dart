import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_dashboard_ui/constants.dart';
import 'package:responsive_dashboard_ui/models/storage_details.dart';

import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    super.key,
  });

  Future<List<StorageInfo>> loadStorageData() async {
    String jsonString =
        await rootBundle.loadString('assets/data/storage_details.json');
    List<dynamic> jsonResponse = json.decode(jsonString);

    return jsonResponse.map((item) => StorageInfo.fromJson(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      // color: secondaryColor,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Storage Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          const Chart(),
          FutureBuilder<List<StorageInfo>>(
            future: loadStorageData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child:
                        CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child:
                        Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                    child: Text('No data available'));
              }

              List<StorageInfo> storageItems = snapshot.data!;

              return Column(
                children: storageItems.map((storage) {
                  return StorageInfoCard(
                    svgSrc: storage.svgSrc,
                    title: storage.title,
                    numOfFiles: storage.numOfFiles,
                    amountOfFiles: storage.amountOfFiles,
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
