import 'package:flutter/services.dart';

abstract class AssetLoader {
  Future<String> loadFileAsString(String assetFileName);
}

class AssetLoaderImpl extends AssetLoader {
  @override
  Future<String> loadFileAsString(String assetFileName) async {
    return await rootBundle.loadString(assetFileName);
  }
}