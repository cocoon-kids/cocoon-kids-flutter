import 'package:bloc_test/bloc_test.dart';
import 'package:cocoon_kids_flutter/bloc/entry_points_cubit.dart';
import 'package:cocoon_kids_flutter/models/entry_points.dart';
import 'package:cocoon_kids_flutter/repository/entry_point_repository.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'EntryPointsCubit_test.mocks.dart';

@GenerateMocks([EntryPointRepository])
void main() {
  final entryPoint = EntryPoint("nav", "text", Colors.red, Colors.blue);

  blocTest(
    "Test EmotionCubit returns emotion based on value from repository",
    build: () {
      final repository = MockEntryPointRepository();

      final stream = Stream.fromIterable([
        [entryPoint]
      ]);

      when(repository.getEntryPoints()).thenAnswer((i) => stream);

      return EntryPointsCubit(repository: repository);
    },
    act: (bloc) => {
      bloc.state
    },
    expect: () => [
      EntryPointsLoadedState(
          [ entryPoint ]
      )
    ],
  );
}