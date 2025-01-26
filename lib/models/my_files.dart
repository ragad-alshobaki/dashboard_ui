import 'package:flutter/material.dart';
import 'package:responsive_dashboard_ui/constants.dart';
import 'dart:convert';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });

  factory CloudStorageInfo.fromJson(Map<String, dynamic> json) {
    return CloudStorageInfo(
      svgSrc: json['svgSrc'] ?? '',
      title: json['title'] ?? '',
      totalStorage: json['totalStorage'] ?? '',
      numOfFiles: json['numOfFiles'] ?? 0,
      percentage: json['percentage'] ?? 0,
      color: Color(int.parse(json['color'] ?? '0xFFFFFFFF')),
      //color: Color(int.parse(json['color'])), // Convert color from hex to Color
    );
  }
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Documents",
    numOfFiles: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Google Drive",
    numOfFiles: 1328,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "2.9GB",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "One Drive",
    numOfFiles: 1328,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "1GB",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Documents",
    numOfFiles: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];