import 'package:cocoon_kids_flutter/colors/colors.dart';
import 'package:cocoon_kids_flutter/models/entry_points.dart';
import 'package:cocoon_kids_flutter/navigation/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

abstract class EntryPointRepository {
  Stream<List<EntryPoint>> getEntryPoints();
}

class EntryPointRepositoryImpl extends EntryPointRepository{
  @override
  Stream<List<EntryPoint>> getEntryPoints() async* {
    final appLocalizations = GetIt.instance.get<AppLocalizations>();
    yield [
      EntryPoint(
          "/${NavigationRoutes.emotions}/${NavigationRoutes.under13}",
          appLocalizations.buttonForUnder13,
          AppColors.yellowDark,
          AppColors.yellowLight
      ),
      EntryPoint(
          "/${NavigationRoutes.emotions}/${NavigationRoutes.over13}",
          appLocalizations.buttonForOver13,
          AppColors.green,
          AppColors.greenLight
      ),
      EntryPoint(
          NavigationRoutes.teachersOrProfessionals,
          appLocalizations.buttonForTeachersAndProfessionals,
          AppColors.blueMedium,
          AppColors.blueLight
      ),
      EntryPoint(
          NavigationRoutes.parentsAndCarers,
          appLocalizations.buttonForParentOrCarer,
          AppColors.pinkMedium,
          AppColors.pinkLight
      ),
    ];
  }
}