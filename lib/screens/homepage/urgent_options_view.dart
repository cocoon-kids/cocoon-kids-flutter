import 'package:cocoon_kids_flutter/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UrgentOptionsView extends StatelessWidget {
  final ButtonStyle helpButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.pinkMedium,
    side: const BorderSide(
      color: Colors.black,
    ),
  );
  final ButtonStyle exitButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.blueMedium,
    side: const BorderSide(
      color: Colors.black,
    ),
  );

  UrgentOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
            onPressed: () => {},
            style: helpButtonStyle,
            icon: const Icon(Icons.arrow_circle_right),
            label: Text(AppLocalizations.of(context)!.buttonForUrgentHelp)
        ),
        const SizedBox(height: 16,),
        ElevatedButton.icon(
            onPressed: () => {},
            style: exitButtonStyle,
            icon: const Icon(Icons.arrow_circle_right),
            label: Text(AppLocalizations.of(context)!.buttonForINeedPrivacy)
        )
      ],
    );
  }
}