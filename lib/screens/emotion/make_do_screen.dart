import 'package:cocoon_kids_flutter/bloc/make_do_cubit.dart';
import 'package:cocoon_kids_flutter/colors/colors.dart';
import 'package:cocoon_kids_flutter/screens/emotion/emotion_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakeDoScreen extends StatefulWidget {
  final int makeDoId;

  const MakeDoScreen(this.makeDoId, {super.key,});

  @override
  State<StatefulWidget> createState() {
    return _MakeDoScreen();
  }
}

class _MakeDoScreen extends State<MakeDoScreen> {
  Widget _mainContent(MakeDoLoadedState state) {
    final MakeDoUiModel model = state.model;

    final String? imagePath = model.imagePath;
    final List<String>? howItHelps = model.howItHelps;

    final List<Widget> howItHelpsWidgets = [];

    if (howItHelps != null) {
      howItHelpsWidgets.add(const SizedBox(height: 16,));
      howItHelpsWidgets.add(const Text("How it helps", style: TextStyles.cardTitleStyle));
      howItHelpsWidgets.addAll(howItHelps.map((e) => Text(e, textAlign: TextAlign.left,)).toList());
    }

    if (model.caution != null) {
      howItHelpsWidgets.add(const SizedBox(height: 16,));
      howItHelpsWidgets.add(DecoratedBox(
        decoration: const BoxDecoration(color: Colors.red),
        child: Padding(padding: const EdgeInsets.all(8), child: Text(model.caution!, style: TextStyle(color: Colors.white),)),
      ));
      howItHelpsWidgets.add(const SizedBox(height: 16,));
    }

    return Card(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title, style: TextStyles.cardTitleStyle,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: imagePath != null ? 120 : 0,
                        child: imagePath != null ? Image.asset(imagePath) : null
                    ),
                    const SizedBox(width: 16,),
                    Expanded(child: Text(model.description))
                  ].whereNotNull().toList(),
                ),
              ].whereNotNull().toList() + howItHelpsWidgets + [
                const SizedBox(height: 16,),
                const Text("What to do", style: TextStyles.cardTitleStyle,),
              ] + model.instructions.map((e) {
                final String? instrImagePath = e.imagePath;

                return Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: instrImagePath != null ? 120 : 0,
                          child: instrImagePath != null ? Image.asset(instrImagePath) : null
                      ),
                      const SizedBox(width: 16,),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: e.steps.mapIndexed((i, step) =>
                                Text("${i+1}. $step")).toList(),
                          )
                      )
                    ].whereNotNull().toList(),
                  ), const SizedBox(height: 16,)
                ]
                );
              }
              ).toList(),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowLight,
      body: BlocProvider(
          create: (_) => MakeDoCubit(widget.makeDoId),
          child: BlocBuilder<MakeDoCubit, MakeDoState>(
            builder: (context, state) {
              if (state is MakeDoLoadedState) {
                return SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SingleChildScrollView(child: _mainContent(state))
                    )
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          )
      ),
    );
  }
}