import 'package:cocoon_kids_flutter/bloc/emotions_cubit.dart';
import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:cocoon_kids_flutter/repository/game_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EmotionDetailUiModel {
  final String name;
  final String description;
  final List<String> symptoms;
  final String imagePath;
  final String emotionRootName;

  EmotionDetailUiModel({
    required this.name,
    required this.description,
    required this.symptoms,
    required this.imagePath,
    required this.emotionRootName,
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
  final GoRouter goRouter;

  final EmotionsRepository emotionsRepository;
  final GameRepository gameRepository;

  EmotionCubit(this.ageRange, this.emotionId, this.goRouter,
      {this.emotionsRepository = const EmotionsRepositoryImpl(), this.gameRepository = const GameRepositoryImpl(), }) : super(EmotionInitState()) {
    emotionsRepository.getEmotion(ageRange, emotionId).listen((event) {
      final emotion = event.emotion;
      final emotionData = event.emotionDataForAge;

      emit(
          EmotionLoadedState(
              EmotionDetailUiModel(
                  name: emotionData.title,
                  description: emotionData.description,
                  symptoms: emotionData.symptoms,
                  imagePath: imagePath(ageRange, emotionData),
                  emotionRootName: emotion.name
              )
          )
      );
    });
  }

  void onPlayClicked() async {
    if (state is EmotionLoadedState) {
      final stateCast = state as EmotionLoadedState;
      final game = await gameRepository
          .getGame(stateCast.emotion.emotionRootName).first;
      
      goRouter.push("/game/${game.id}");
    } else {

    }
  }
}