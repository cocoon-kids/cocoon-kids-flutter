import 'package:cocoon_kids_flutter/bloc/emotions_cubit.dart';
import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:cocoon_kids_flutter/repository/file_loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmotionDetailUiModel {
  final String name;
  final String description;
  final List<String> symptoms;
  final String imagePath;

  EmotionDetailUiModel({
    required this.name,
    required this.description,
    required this.symptoms,
    required this.imagePath
  });
}

abstract class EmotionState { }

class EmotionInitState extends EmotionState {}

class EmotionLoadedState extends EmotionState {
  final EmotionDetailUiModel emotion;

  EmotionLoadedState(this.emotion);
}

class EmotionCubit extends Cubit<EmotionState> {
  final AgeRange ageRange;
  final int emotionId;

  final repository = EmotionsRepositoryImpl(AssetLoaderImpl());

  EmotionCubit(this.ageRange, this.emotionId) : super(EmotionInitState()) {
    repository.getEmotion(ageRange, emotionId).listen((event) {
      emit(
          EmotionLoadedState(
              EmotionDetailUiModel(
                  name: event.title,
                  description: event.description,
                  symptoms: event.symptoms,
                  imagePath: imagePath(ageRange, event)
              )
          )
      );
    });
  }
}