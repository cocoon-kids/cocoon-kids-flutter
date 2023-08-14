import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_asset_loader.dart';


void main() {
  test("Emotions repository loads emotions data without exception from json file", () async {
    final emotionsRepository = EmotionsRepositoryImpl(TestAssetLoader());

    await emotionsRepository.getEmotions().first;
  });

  test("Emotions repository loads an emotion without exception from json file", () async {
    final emotionsRepository = EmotionsRepositoryImpl(TestAssetLoader());

    final emotion = await emotionsRepository.getEmotion(AgeRange.over13, 5).first;

    expect(emotion.image, "bored.jpg");
  });
}