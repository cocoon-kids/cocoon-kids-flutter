import 'dart:math';

import 'package:cocoon_kids_flutter/bloc/entry_points_cubit.dart';
import 'package:cocoon_kids_flutter/models/entry_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryPointsWidget extends StatelessWidget {
  const EntryPointsWidget({super.key});

  Widget _createItem(EntryPoint e) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = min(constraints.maxWidth, constraints.maxHeight);

        return SizedBox(
            width: size,
            height: size,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: DecoratedBox(
                    decoration: BoxDecoration(color: e.boxColor, border: Border.all(color: e.borderColor)),
                    child: Align(
                      alignment: Alignment.center, // align type
                      child: Text(
                        e.text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                )
            )
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntryPointsCubit, EntryPointsState>(
        builder: (context, state) {
          if (state is EntryPointsLoadedState) {
            return Padding(
                padding: const EdgeInsets.all(8),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: state.entryPoints.map(
                          (e) => _createItem(e)
                  ).toList(),
                )
            );
          } else {
            return const CircularProgressIndicator();
          }
        }
    );
  }
}