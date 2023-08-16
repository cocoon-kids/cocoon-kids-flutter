import 'package:cocoon_kids_flutter/models/children_data.dart';
import 'package:cocoon_kids_flutter/repository/database.dart';
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

class EmotionWithAgeAppropriateData {
  final Emotion emotion;
  final EmotionDataForAge emotionDataForAge;

  EmotionWithAgeAppropriateData(this.emotion, this.emotionDataForAge);
}

abstract class EmotionsRepository {
  Stream<List<Emotion>> getEmotions();
  Stream<EmotionWithAgeAppropriateData> getEmotion(AgeRange ageRange, int id);

  const EmotionsRepository();
}

class EmotionsRepositoryImpl extends EmotionsRepository {
  final AssetLoader fileLoader;

  const EmotionsRepositoryImpl([this.fileLoader = const AssetLoaderImpl()]);

  @override
  Stream<List<Emotion>> getEmotions() async* {
    final db = await loadDatabase(fileLoader);

    yield db.emotions;
  }

  @override
  Stream<EmotionWithAgeAppropriateData> getEmotion(AgeRange ageRange, int id) async* {
    final db = await loadDatabase(fileLoader);

    final emotions = db.emotions;
    final emotion = emotions.firstWhere((e) => e.id == id);

    yield EmotionWithAgeAppropriateData(
        emotion,
        getEmotionData(ageRange, emotion)
    );
  }
}