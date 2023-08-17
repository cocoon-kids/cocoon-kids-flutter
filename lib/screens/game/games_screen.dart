import 'package:cocoon_kids_flutter/bloc/games_cubit.dart';
import 'package:cocoon_kids_flutter/colors/colors.dart';
import 'package:cocoon_kids_flutter/screens/app_scaffold.dart';
import 'package:cocoon_kids_flutter/screens/emotion/emotion_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  Widget _gameItemMainContentParent(Widget widget) {
    return Padding(padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8), child: widget);
  }

  Widget _gameItem(GameUiListItem game, Function(GameUiListItem) onTap) {
    return InkWell(
        onTap: () => onTap(game),
        child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(game.imagePath,),
                const SizedBox(height: 8,),
                _gameItemMainContentParent(Text(game.name, style: TextStyles.cardTitleStyle,)),
                const SizedBox(height: 8,),
                _gameItemMainContentParent(Text(game.description,)),
                const SizedBox(height: 8,),
                _gameItemMainContentParent(
                    Wrap(
                      spacing: 2,
                      runSpacing: 2,
                      children: game.emotions.map((e) => Chip(label: Text(e))).toList(),
                    )
                )
              ],
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        backgroundColor: AppColors.yellowLight,
        body: BlocProvider(
            create: (_) => GamesCubit(),
            child: BlocBuilder<GamesCubit, GamesState>(
                builder: (context, state) {
                  if (state is GamesLoadedState) {
                    return SingleChildScrollView(
                        child: LayoutGrid(
                          // set some flexible track sizes based on the crossAxisCount
                          columnSizes: [1.fr, 1.fr],
                          // set all the row sizes to auto (self-sizing height)
                          rowSizes: List.generate(state.games.length~/3, (index) => [intrinsic(), intrinsic()]).flattened.toList(),
                          rowGap: 40, // equivalent to mainAxisSpacing
                          columnGap: 24, // equivalent to crossAxisSpacing
                          // note: there's no childAspectRatio
                          children: state.games.map(
                                  (e) => _gameItem(
                                  e,
                                      (game) => context.push("/game/${game.id}")
                              )
                          ).toList(),
                        )
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }
            )
        )
    );
  }
}