import 'package:cocoon_kids_flutter/repository/game_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GameState { }

class GameInitState extends GameState {}

class GameLoadedState extends GameState {
  final String url;

  GameLoadedState(this.url);
}

class GameCubit extends Cubit<GameState> {
  final int id;
  final GameRepository gameRepository;

  GameCubit(this.id, [this.gameRepository = const GameRepositoryImpl()]) : super(GameInitState()) {
    gameRepository.getGameById(id).listen((event) {
      emit(GameLoadedState(event.game));
    });
  }
}