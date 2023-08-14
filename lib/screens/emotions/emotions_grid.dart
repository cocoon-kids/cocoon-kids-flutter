import 'package:cocoon_kids_flutter/bloc/emotions_cubit.dart';
import 'package:cocoon_kids_flutter/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EmotionsGrid extends StatelessWidget {
  const EmotionsGrid({super.key});

  Widget _createItem(EmotionListItemUiModel e, Function(EmotionListItemUiModel) onClick) {
    return InkWell(
        onTap: () => onClick(e),
        child: Padding (
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Image.asset(e.imagePath)),
                Text(e.name.capitalize()),
              ],
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmotionsCubit, EmotionsState>(
        builder: (context, state) {
          if (state is EmotionsLoadedState) {
            return GridView.count(
              crossAxisCount: 2,
              children: state.emotions.map((e) => _createItem(
                  e, (emotion) { context.push(e.navigationEndPoint); }
              )).toList(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}