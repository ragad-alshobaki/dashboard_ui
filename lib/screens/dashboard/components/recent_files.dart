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
  final String? icon, title, date, size;
  const RecentFiles({
    super.key, this.icon, this.title, this.date, this.size,
  });

  @override
  State<RecentFiles> createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  List<RecentFile> recentFiles = [];
  @override
  void initState() {
    super.initState();
    loadJsonAndInsertIntoDatabase();  //=widget initialized
  }

  Future<void> loadJsonAndInsertIntoDatabase() async {
    final DatabaseHelper dbHelper = DatabaseHelper();
    final db = await dbHelper.database;

    String jsonString = await rootBundle.loadString('assets/data/recent_files.json');
    List<dynamic> jsonData = json.decode(jsonString);

    for (var item in jsonData) {
      RecentFile file = RecentFile.fromJson(item);
      await db.insert('recent_files', file.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    } //to SQFlite

    print("Data inserted into database successfully!");

    // Fetch data from SQFlite after insertion
    final List<Map<String, dynamic>> queryResult = await db.query('recent_files');
    setState(() {
      // Update the UI with the data from the database
      recentFiles = queryResult.map((e) => RecentFile.fromMap(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return
    recentFiles.isEmpty? Container():
    Container(
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
                    recentFiles.length,
                    (index) => recentFileDataRow(
                        recentFiles[index]))),
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