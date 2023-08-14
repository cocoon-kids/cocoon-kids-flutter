import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_asset_loader.dart';


void main() {
  test("Emotions repository loads data without exception from json file", () async {
    final emotionsRepository = EmotionsRepositoryImpl(TestAssetLoader());

    await emotionsRepository.getEmotions().first;
  });
}