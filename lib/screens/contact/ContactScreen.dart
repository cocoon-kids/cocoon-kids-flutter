import 'package:cocoon_kids_flutter/screens/emotion/emotion_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Speak to someone", style: TextStyles.cardTitleStyle),
        Row(
          children: [
            ElevatedButton(onPressed: () => "", child: const Text("Do X")),
            ElevatedButton(onPressed: () => "", child: const Text("Do Y")),
            ElevatedButton(onPressed: () => "", child: const Text("Do Z")),
          ],
        )
      ],
    );
  }

}