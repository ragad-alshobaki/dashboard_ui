import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard_ui/constants.dart';
import 'package:responsive_dashboard_ui/models/RecentFile.dart';
import 'package:responsive_dashboard_ui/services/database_helper.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

class RecentFiles extends StatefulWidget {
  const RecentFiles({super.key});

  @override
  State<RecentFiles> createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  Future<void> loadJsonAndInsertIntoDatabase() async {
    String jsonString = await rootBundle.loadString('assets/recent_files.json');
    List<dynamic> jsonData = json.decode(jsonString);

    List<RecentFile> files =
        jsonData.map((e) => RecentFile.fromJson(e)).toList();
    await dbHelper.insertRecentFile(files);
  }

  // List<RecentFile> recentFiles = [];
  @override
  void initState() {
    super.initState();
    loadJsonAndInsertIntoDatabase(); //=widget initialized
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecentFile>>(
        future: dbHelper.getRecentFiles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("Error: ${snapshot.error}");
            return Center(child: Text('Error loading recent files'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No recent files available'));
          }

          final recentFiles = snapshot.data!;

          return Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                    rows: recentFiles
                        .map((file) => recentFileDataRow(file))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(cells: [
    DataCell(Row(
      children: [
        SvgPicture.asset(
          fileInfo.icon!,
          height: 30,
          width: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(fileInfo.title!),
        )
      ],
    )),
    DataCell(Text(fileInfo.date!)),
    DataCell(Text(fileInfo.size!))
  ]);
}
