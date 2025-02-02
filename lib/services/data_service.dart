import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:responsive_dashboard_ui/models/my_files.dart';

Future<List<CloudStorageInfo>> fetchMyFiles() async {
  final String response = await rootBundle.loadString('assets/data/my_files.json');
  final List<dynamic> data = json.decode(response);

  return data.map((json) => CloudStorageInfo.fromJson(json)).toList();
}
