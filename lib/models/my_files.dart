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