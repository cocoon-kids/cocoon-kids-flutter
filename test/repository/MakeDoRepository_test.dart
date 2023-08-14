import 'package:cocoon_kids_flutter/models/children_data.dart';
import 'package:cocoon_kids_flutter/repository/make_do_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'test_asset_loader.dart';

@GenerateMocks([Emotion])
void main() {
  test("Make/Do repository loads game data without exception from json file", () async {
    final makeDoRepository = MakeDoRepositoryImpl(TestAssetLoader());

    print(await makeDoRepository.getMakeDoList().first);
  });
}