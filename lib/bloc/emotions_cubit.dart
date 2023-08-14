import 'package:cocoon_kids_flutter/models/children_data.dart';
import 'package:cocoon_kids_flutter/navigation/routes.dart';
import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String imagePath(AgeRange ageRange, EmotionDataForAge emotionDataForAge) {
  return "assets/images/emotions/${ageRange.name}/${emotionDataForAge.image}";
}

class EmotionListItemUiModel {
  final String name;
  final String imagePath;
  final String navigationEndPoint;

  EmotionListItemUiModel({required this.name, required this.imagePath, required this.navigationEndPoint});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmotionListItemUiModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          imagePath == other.imagePath &&
          navigationEndPoint == other.navigationEndPoint;

  @override
  int get hashCode =>
      name.hashCode ^ imagePath.hashCode ^ navigationEndPoint.hashCode;
}

abstract class EmotionsState { }

class EmotionsInitState extends EmotionsState {}

class EmotionsLoadedState extends EmotionsState {
  final List<EmotionListItemUiModel> emotions;

  EmotionsLoadedState(this.emotions);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmotionsLoadedState &&
          runtimeType == other.runtimeType &&
          const ListEquality().equals(emotions, other.emotions);

  @override
  int get hashCode => emotions.hashCode;
}

class EmotionsCubit extends Cubit<EmotionsState> {
  final AgeRange ageRange;

  final EmotionsRepository repository;

  EmotionsCubit(this.ageRange, {this.repository = const EmotionsRepositoryImpl()}) : super(EmotionsInitState()) {
    repository.getEmotions().listen((event) {
      emit(
          EmotionsLoadedState(
              event.map((e) => EmotionListItemUiModel(
                name: e.name,
                imagePath: imagePath(ageRange, getEmotionData(ageRange, e)),
                  navigationEndPoint: "/${NavigationRoutes.emotions}/${ageRange.name}/${e.id}",
              )
              ).toList()
          )
      );
    });
  }
}