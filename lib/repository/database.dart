import 'dart:convert';

import 'package:cocoon_kids_flutter/models/children_data.dart';
import 'package:cocoon_kids_flutter/repository/file_loader.dart';

Future<ChildrenData> loadDatabase([AssetLoader assetLoader = const AssetLoaderImpl()]) async {
  return ChildrenData.fromJson(jsonDecode(await assetLoader.loadFileAsString("assets/db.json")));
}