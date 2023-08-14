import 'package:flutter/services.dart';

abstract class AssetLoader {

  Future<String> loadFileAsString(String assetFileName);

  const AssetLoader();
}

class AssetLoaderImpl extends AssetLoader {

  @override
  Future<String> loadFileAsString(String assetFileName) async {
    return await rootBundle.loadString(assetFileName);
  }

  const AssetLoaderImpl();
}