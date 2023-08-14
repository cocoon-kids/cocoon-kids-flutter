import 'dart:io';

import 'package:cocoon_kids_flutter/repository/file_loader.dart';

class TestAssetLoader extends AssetLoader {
  @override
  Future<String> loadFileAsString(String assetFileName) async {
    final file = File(assetFileName);

    return file.readAsString();
  }
}