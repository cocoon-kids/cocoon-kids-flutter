import 'package:cocoon_kids_flutter/models/children_data.dart';
import 'package:cocoon_kids_flutter/navigation/routes.dart';
import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:cocoon_kids_flutter/repository/file_loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String imagePath(AgeRange ageRange, EmotionDataForAge emotionDataForAge) {
  return "assets/images/emotions/${ageRange.name}/${emotionDataForAge.image}";
}

class EmotionListItemUiModel {
  final String name;
  final String imagePath;
  final String navigationEndPoint;

  EmotionListItemUiModel({required this.name, required this.imagePath, required this.navigationEndPoint});
}

abstract class EmotionsState { }

class EmotionsInitState extends EmotionsState {}

class EmotionsLoadedState extends EmotionsState {
  final List<EmotionListItemUiModel> emotions;

  EmotionsLoadedState(this.emotions);
}

class EmotionsCubit extends Cubit<EmotionsState> {
  final AgeRange ageRange;
  final repository = EmotionsRepositoryImpl(AssetLoaderImpl());

  EmotionsCubit(this.ageRange) : super(EmotionsInitState()) {
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