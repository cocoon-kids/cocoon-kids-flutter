import 'package:bloc_test/bloc_test.dart';
import 'package:cocoon_kids_flutter/bloc/emotion_cubit.dart';
import 'package:cocoon_kids_flutter/models/children_data.dart';
import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'EmotionCubit_test.mocks.dart';

@GenerateMocks([EmotionsRepository])
void main() {
  blocTest(
    "Test EmotionCubit returns emotion based on value from repository",
    build: () {
      final repository = MockEmotionsRepository();

      final stream = Stream.fromIterable([EmotionDataForAge(
        "title",
        "image",
        "description",
        ["sym1", "sym2"],
      )]);

      when(repository.getEmotion(any, any)).thenAnswer((i) => stream);

      return EmotionCubit(AgeRange.over13, 1, repository: repository);
    },
    act: (bloc) => {
      bloc.state
    },
    expect: () => [
      EmotionLoadedState(
          EmotionDetailUiModel(
              name: "title",
              description: "description",
              symptoms: ["sym1", "sym2"],
              imagePath: "assets/images/emotions/over13/image"
          )
      )
    ],
  );
}