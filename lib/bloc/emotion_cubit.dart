import 'package:cocoon_kids_flutter/bloc/emotions_cubit.dart';
import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:collection/collection.dart';
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmotionDetailUiModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          const ListEquality().equals(symptoms, other.symptoms) &&
          imagePath == other.imagePath;

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      symptoms.hashCode ^
      imagePath.hashCode;
}

abstract class EmotionState { }

class EmotionInitState extends EmotionState {
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EmotionLoadedState &&
              runtimeType == other.runtimeType;
}

class EmotionLoadedState extends EmotionState {
  final EmotionDetailUiModel emotion;

  EmotionLoadedState(this.emotion);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmotionLoadedState &&
          runtimeType == other.runtimeType &&
          emotion == other.emotion;

  @override
  int get hashCode => emotion.hashCode;
}

class EmotionCubit extends Cubit<EmotionState> {
  final AgeRange ageRange;
  final int emotionId;

  final EmotionsRepository repository;

  EmotionCubit(this.ageRange, this.emotionId, {this.repository = const EmotionsRepositoryImpl()}) : super(EmotionInitState()) {
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