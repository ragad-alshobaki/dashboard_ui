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
    String jsonString = await rootBundle.loadString('assets/storage_details.json');
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
          StorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Documents Files",
            numOfFiles: 1328,
            amountOfFiles: "1.3GGB",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "Media Files",
            numOfFiles: 1328,
            amountOfFiles: "15.3GGB",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "Other Files",
            numOfFiles: 1328,
            amountOfFiles: "1.3GGB",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Unknown",
            numOfFiles: 140,
            amountOfFiles: "1.3GGB",
          ),
        ],
      ),
    );
  }
}

