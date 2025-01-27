import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard_ui/constants.dart';
import 'package:responsive_dashboard_ui/models/RecentFile.dart';

class RecentFiles extends StatelessWidget {
  final String? icon, title, date, size;
  const RecentFiles({
    super.key, this.icon, this.title, this.date, this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius:
              const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Files",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                columnSpacing: defaultPadding,
                horizontalMargin: 0,
                columns: [
                  DataColumn(label: Text("File Name")),
                  DataColumn(label: Text("Data")),
                  DataColumn(label: Text("Size"))
                ],
                rows: List.generate(
                    demoRecentFiles.length,
                    (index) => recentFileDataRow(
                        demoRecentFiles[index]))),
          ),
        ],
      ),
    );
  }
}

  DataRow recentFileDataRow(RecentFile fileInfo) {
    return DataRow(cells: [
      DataCell(Row(
        children: [
          SvgPicture.asset(
            fileInfo.icon !,
            height: 30,
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(fileInfo.title !),
          )
        ],
      )),
      DataCell(Text(fileInfo.date !)),
      DataCell(Text(fileInfo.size !))
    ]);
  }
