import 'package:cocoon_kids_flutter/bloc/emotions_cubit.dart';
import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:cocoon_kids_flutter/screens/emotions/emotions_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmotionsScreen extends StatefulWidget {
  final AgeRange ageRange;

  const EmotionsScreen({super.key, required this.ageRange});

  @override
  State<StatefulWidget> createState() {
    return _EmotionsState();
  }
}

class _EmotionsState extends State<EmotionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My emotions right now"),
        ),
        body: BlocProvider(
          create: (_) => EmotionsCubit(widget.ageRange),
          child: const Align(
              alignment: Alignment.center,
              child: EmotionsGrid()
          ),
          //),
        )
    );
  }
}