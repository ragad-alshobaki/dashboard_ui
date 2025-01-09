import 'package:flutter/material.dart';
import 'package:responsive_dashboard_ui/constants.dart';

import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      // color: secondaryColor,
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Storage Details",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Chart(),
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

