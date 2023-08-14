import 'package:cocoon_kids_flutter/models/children_data.dart';
import 'package:cocoon_kids_flutter/repository/database.dart';
import 'package:cocoon_kids_flutter/repository/file_loader.dart';
import 'package:collection/collection.dart';

abstract class MakeDoRepository {
  Stream<MakeDo?> getMakeDo(String emotionName);
  Stream<MakeDo> getMakeDoById(int id);

  const MakeDoRepository();
}

class MakeDoRepositoryImpl extends MakeDoRepository {
  final AssetLoader assetLoader;

  const MakeDoRepositoryImpl([this.assetLoader = const AssetLoaderImpl()]);

  Stream<List<MakeDo>> getMakeDoList() async* {
    yield (await loadDatabase(assetLoader)).makeDoList;
  }

  @override
  Stream<MakeDo?> getMakeDo(String emotionName) {
    return getMakeDoList().map((event) => event.firstWhereOrNull((element) => element.emotions.contains(emotionName)));
  }

  @override
  Stream<MakeDo> getMakeDoById(int id) {
    return getMakeDoList().map((event) => event.firstWhere((element) => element.id == id));
  }
}