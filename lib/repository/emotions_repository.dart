import 'dart:convert';

import 'package:cocoon_kids_flutter/models/children_data.dart';
import 'package:cocoon_kids_flutter/repository/file_loader.dart';

enum AgeRange {
  under13,
  over13;
}

EmotionDataForAge getEmotionData(AgeRange ageRange, Emotion e) {
  switch (ageRange) {
    case AgeRange.under13:
      return e.under13;
    case AgeRange.over13:
      return e.over13;
  }
}

abstract class EmotionsRepository {
  Stream<List<Emotion>> getEmotions();
  Stream<EmotionDataForAge> getEmotion(AgeRange ageRange, int id);

  const EmotionsRepository();
}

class EmotionsRepositoryImpl extends EmotionsRepository {
  final AssetLoader fileLoader;

  const EmotionsRepositoryImpl([this.fileLoader = const AssetLoaderImpl()]);

  @override
  Stream<List<Emotion>> getEmotions() async* {
    final db = jsonDecode(await fileLoader.loadFileAsString("assets/db.json"));
    yield ChildrenData.fromJson(db).emotions;
  }

  @override
  Stream<EmotionDataForAge> getEmotion(AgeRange ageRange, int id) async* {
    final db = jsonDecode(await fileLoader.loadFileAsString("assets/db.json"));

    final emotions = ChildrenData.fromJson(db).emotions;
    final emotion = emotions.firstWhere((e) => e.id == id);

    yield getEmotionData(ageRange, emotion);
  }
}