import 'package:cocoon_kids_flutter/models/children_data.dart';
import 'package:cocoon_kids_flutter/repository/database.dart';
import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:cocoon_kids_flutter/repository/file_loader.dart';

abstract class MakeDoRepository {
  Stream<Iterable<MakeDo>> getMakeDoListForEmotion(String emotionName, AgeRange ageRange);
  Stream<MakeDo> getMakeDoById(int id);
  Stream<Iterable<MakeDo>> getMakeDoListByIds(Iterable<int> ids);

  const MakeDoRepository();
}

class MakeDoRepositoryImpl extends MakeDoRepository {
  final AssetLoader assetLoader;

  const MakeDoRepositoryImpl([this.assetLoader = const AssetLoaderImpl()]);

  Stream<List<MakeDo>> getMakeDoList() async* {
    yield (await loadDatabase(assetLoader)).makeDoList;
  }

  @override
  Stream<Iterable<MakeDo>> getMakeDoListForEmotion(String emotionName, AgeRange ageRange) {
    return getMakeDoList().map((event) => event.where(
            (element) {
          final isAppropriateForAge = (ageRange == AgeRange.under13 && element.under13) ||
              (ageRange == AgeRange.over13 && element.over13);
          return element.emotions.contains(emotionName) && isAppropriateForAge;
        }
    )
    );
  }

  @override
  Stream<MakeDo> getMakeDoById(int id) {
    return getMakeDoList().map((event) => event.firstWhere((element) => element.id == id));
  }

  @override
  Stream<Iterable<MakeDo>> getMakeDoListByIds(Iterable<int> ids,) {
    return getMakeDoList().map((event) => event.where((element) => ids.contains(element.id)));
  }
}