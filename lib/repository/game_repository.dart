import 'package:cocoon_kids_flutter/models/children_data.dart';
import 'package:cocoon_kids_flutter/repository/file_loader.dart';

import 'database.dart';

abstract class GameRepository {
  Stream<Game> getGame(String emotion);

  const GameRepository();

  Stream<Game> getGameById(int id);
}

class GameRepositoryImpl extends GameRepository {
  final AssetLoader fileLoader;

  @override
  Stream<Game> getGame(String emotionRootName) {
    return getGames().map(
            (games) => games.firstWhere(
                (element) => element.emotions.contains(emotionRootName,)
        )
    );
  }

  Stream<List<Game>> getGames() async* {
    final db = await loadDatabase(fileLoader);

    yield db.games;
  }

  @override
  Stream<Game> getGameById(int id) async* {
    final db = await loadDatabase(fileLoader);

    yield db.games.firstWhere((element) => element.id == id);
  }

  const GameRepositoryImpl([this.fileLoader = const AssetLoaderImpl()]);
}