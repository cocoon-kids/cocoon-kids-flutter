import 'package:cocoon_kids_flutter/navigation/routes.dart';
import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:cocoon_kids_flutter/screens/about/about_screen.dart';
import 'package:cocoon_kids_flutter/screens/contact/ContactScreen.dart';
import 'package:cocoon_kids_flutter/screens/dialog_page.dart';
import 'package:cocoon_kids_flutter/screens/emotion/emotion_screen.dart';
import 'package:cocoon_kids_flutter/screens/emotion/make_do_screen.dart';
import 'package:cocoon_kids_flutter/screens/emotions/emotions_screen.dart';
import 'package:cocoon_kids_flutter/screens/game/play_game_screen.dart';
import 'package:cocoon_kids_flutter/screens/homepage/homepage_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

extension _StringExtension on String? {
  AgeRange pathToAgeRange() {
    if (this == NavigationRoutes.under13) {
      return AgeRange.under13;
    } else if (this == NavigationRoutes.over13){
      return AgeRange.over13;
    } else {
      throw Exception("Unable to navigate to emotions route without an age range");
    }
  }
}

extension _GoRouterStateExtension on GoRouterState {
  AgeRange getAgeRange() {
    return pathParameters[NavigationRoutes.ageRange]
        .pathToAgeRange();
  }

  int getEmotionId() {
    final emotionIdStr = pathParameters[NavigationRoutes.emotion];

    if (emotionIdStr == null) {
      throw Exception("Emotion id must not be null");
    }
    return int.parse(emotionIdStr);
  }
}

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        if (!GetIt.instance.isRegistered<AppLocalizations>()) {
          GetIt.instance.registerSingleton<AppLocalizations>(
              AppLocalizations.of(context)!);
        }

        return const Homepage(title: "Landing");
      },
      routes: <RouteBase>[
        GoRoute(
          path: '${NavigationRoutes.emotions}/:${NavigationRoutes.ageRange}',
          builder: (BuildContext context, GoRouterState state) {
            final AgeRange ageRangeEnum = state.getAgeRange();

            return EmotionsScreen(
                ageRange: ageRangeEnum
            );
          },
        ),
        GoRoute(
          path: '${NavigationRoutes.emotions}/:${NavigationRoutes.ageRange}/:${NavigationRoutes.emotion}',
          builder: (BuildContext context, GoRouterState state) {
            final AgeRange ageRangeEnum = state.getAgeRange();
            final emotion = state.getEmotionId();

            return EmotionScreen(
              ageRange: ageRangeEnum,
              emotionId: emotion,
            );
          },
        ),
        GoRoute(
          path: 'makedo/:id',
          builder: (BuildContext context, GoRouterState state) {
            return MakeDoScreen(int.parse(state.pathParameters["id"]!));
          },
        ),
        GoRoute(
          path: 'game/:id',
          builder: (BuildContext context, GoRouterState state) {
            return PlayGameScreen(int.parse(state.pathParameters["id"]!));
          },
        ),
        GoRoute(
            path: 'contact',
            pageBuilder: (context, state) => DialogPage(child: ContactScreen())
        ),
        GoRoute(
            path: 'about',
            builder: (context, state) => AboutScreen()
        ),
      ],
    ),
  ],
);