import 'package:bloc_test/bloc_test.dart';
import 'package:cocoon_kids_flutter/bloc/emotions_cubit.dart';
import 'package:cocoon_kids_flutter/models/children_data.dart';
import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'EmotionsCubit_test.mocks.dart';

EmotionsCubit _testBuildWithData(AgeRange ageRange) {
  final repository = MockEmotionsRepository();

  final stream = Stream.fromIterable([
    [
      Emotion(
          1,
          "name",
          true,
          EmotionDataForAge(
            "title1",
            "image1",
            "description1",
            ["sym1", "sym2"],
          ),
          EmotionDataForAge(
            "title2",
            "image2",
            "description2",
            ["sym3", "sym4"],
          )
      )
    ]
  ]);

  when(repository.getEmotions()).thenAnswer((i) => stream);

  return EmotionsCubit(ageRange, repository: repository);
}

@GenerateMocks([EmotionsRepository])
void main() {
  blocTest(
    "Test EmotionsCubit returns emotion based on value from repository for over 13",
    build: () {
      return _testBuildWithData(AgeRange.over13);
    },
    act: (bloc) => { bloc.state },
    expect: () => [
      EmotionsLoadedState(
          [
            EmotionListItemUiModel(
                name: "name",
                imagePath: "assets/images/emotions/over13/image2",
                navigationEndPoint: "/emotions/over13/1"
            )
          ]
      )
    ],
  );
  blocTest(
    "Test EmotionsCubit returns emotion based on value from repository for under 13",
    build: () {
      return _testBuildWithData(AgeRange.under13);
    },
    act: (bloc) => { bloc.state },
    expect: () => [
      EmotionsLoadedState(
          [
            EmotionListItemUiModel(
                name: "name",
                imagePath: "assets/images/emotions/under13/image1",
                navigationEndPoint: "/emotions/under13/1"
            )
          ]
      )
    ],
  );
}