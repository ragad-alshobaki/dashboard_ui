import '../models/storage_details.dart';

class StorageService {
  List<StorageInfo> parseStorageData(List<dynamic> jsonData) {
    return jsonData.map((data) => StorageInfo.fromJson(data)).toList();
  }
}
