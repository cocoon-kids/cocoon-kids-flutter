import 'package:cocoon_kids_flutter/repository/game_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GamesState { }

class GameUiListItem {
  final int id;
  final String name;
  final String description;
  final List<String> emotions;
  final String imagePath;

  GameUiListItem({required this.id, required this.name, required this.description, required this.emotions, required this.imagePath});
}

class GamesInitState extends GamesState {}

class GamesLoadedState extends GamesState {
  final List<GameUiListItem> games;

  GamesLoadedState(this.games);
}

class GamesCubit extends Cubit<GamesState> {
  final GameRepository gameRepository;

  GamesCubit([this.gameRepository = const GameRepositoryImpl()]) : super(GamesInitState()) {
    gameRepository.getGames().listen((event) {
      emit(GamesLoadedState(
          event.map((e) => GameUiListItem(
              id: e.id,
              name: e.name,
              description: e.description,
              emotions: e.emotions,
              imagePath: "assets/images/play/${e.src}"
          )).toList()
      ));
    });
  }
}