import 'package:cocoon_kids_flutter/bloc/emotion_cubit.dart';
import 'package:cocoon_kids_flutter/colors/colors.dart';
import 'package:cocoon_kids_flutter/repository/emotions_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextStyles {
  static const mainTitleStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold
  );
  static const cardTitleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold
  );
}

class EmotionScreen extends StatefulWidget {
  final AgeRange ageRange;
  final int emotionId;

  const EmotionScreen({super.key, required this.ageRange, required this.emotionId});

  @override
  State<StatefulWidget> createState() {
    return _EmotionState();
  }
}

class _EmotionState extends State<EmotionScreen> {
  Widget _title(String text) {
    return Text(text, textAlign: TextAlign.center, style: TextStyles.mainTitleStyle,);
  }

  Widget _button({required Function() onPressed, required String text}) {
    return SizedBox(width: 150, child: ElevatedButton(onPressed: onPressed, child: Text(text)));
  }

  Widget _card({required Widget child}) {
    return Card(
        color: Colors.white,
        child: Padding (
            padding: const EdgeInsets.all(16),
            child: child
        )
    );
  }


  Widget _buttons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _button(onPressed: () => "", text: "Make/Do"),
              const SizedBox(width: 16,),
              _button(onPressed: () => "", text: "Play/Game"),
            ]
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _button(onPressed: () => "", text: "Join/Go"),
              const SizedBox(width: 16,),
              _button(onPressed: () => "", text: "Chat/Speak")
            ]
        )
      ],
    );
  }

  Widget _emotionCard(EmotionDetailUiModel model) {
    return _card(
        child: Row(
          children: [
            CircleAvatar(radius: 20, backgroundImage: AssetImage(model.imagePath)),
            const SizedBox(width: 8,),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.name, style: TextStyles.cardTitleStyle,),
                      Text(model.description)
                    ]
                )
            )
          ],
        )
    );
  }

  Widget _symptomsCard(EmotionDetailUiModel model) {
    return _card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Things you may notice", style: TextStyles.cardTitleStyle,),
            ] + model.symptoms.map((e) => Text("• $e")).toList()
        )
    );
  }

  Widget _mainContent(EmotionDetailUiModel model) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title("You are ${model.name.toLowerCase()}"),
                    _emotionCard(model),
                    _symptomsCard(model),
                  ]
              )
          ),
        ),
        _buttons(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.yellowLight,
        body: BlocProvider(
          create: (_) => EmotionCubit(widget.ageRange, widget.emotionId),
          child: BlocBuilder<EmotionCubit, EmotionState>(
              builder: (context, state) {
                if (state is EmotionLoadedState) {
                  return SafeArea(
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: _mainContent(state.emotion)
                      )
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }
          ),
        )
    );
  }

}