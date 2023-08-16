import 'package:cocoon_kids_flutter/colors/colors.dart';
import 'package:cocoon_kids_flutter/screens/app_scaffold.dart';
import 'package:cocoon_kids_flutter/screens/emotion/emotion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  Widget _card({String? title, required String body, String? subtitle}) {
    final children = <Widget>[];

    if (title != null) {
      children.addAll(
          [
            Text(title, style: TextStyles.cardTitleStyle),
            const SizedBox(height: 8,)
          ]
      );
    }

    if (subtitle != null) {
      children.addAll(
          [
            Text(subtitle, style: TextStyles.cardSubtitleStyle),
            const SizedBox(height: 8,)
          ]
      );
    }

    children.addAll([
      const SizedBox(height: 8,), Text(body),
    ]);

    return Card(
        color: Colors.white,
        child: Padding (
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        )
    );
  }

  _cardSpacer() {
    return const SizedBox(height: 8,);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        backgroundColor: AppColors.yellowLight,
        body: SingleChildScrollView(
            child: Column(
              children: [
                _card(
                  title: "About us",
                  body: AppLocalizations.of(context)!.aboutUsDescription,
                ),
                _cardSpacer(),
                _card(
                  title: "What you asked for",
                  body: "Above all you want your child, young person and yourself to be and feel safe, valued and listened to when using any app.",
                ),
                _cardSpacer(),
                _card(
                  title: "We listened carefully.",
                  body: """
                  You told us that there are worrying and sometimes dangerous links on other sites. You said you don't want inappropriate adverts. You want to know the price and cost upfront - and not have to pay extra suddenly, to get the full program. You wanted to be able to adapt the app to make it personalised for you and your child, young person or family's needs.

We use a few carefully selected links. But importantly, these have been checked to be appropriate and stop at that page. This means your child or young person can't link out of this app. We also have some links that a only for parents and carers, teachers and other professionals. Only adults with an account can access these. You can choose to allow these to be accessed by your child or young person by toggling the buttons on the parent and carer dashboard. You can toggle the features on the site map so they better fit you, your child or young person, or your family's needs.""".trim(),
                ),
                _cardSpacer(),
                _card(
                  title: "Organisations we work with",
                  body: """
                 (Sensory app house) have kindly allowed us to use and share their sensory regulatory apps at no cost to us. Their apps are great, and are safe to use because they don't have any adverts, pop-ups, or dangerous lnks away from their site.

Chrystal Clear Campaign
""".trim(),
                ),
                _cardSpacer(),
                _card(
                  title: "ASMR",
                  subtitle: "How does this help?",
                  body: """
                    Dr. Craig Richard is a scientist at Shenandoah University in Virginia, and an ASMR expert. He says that ASMR can help you to have a deep relaxed feeling often with light and enjoyable brain tingles. In scientific tests, ASMR shows that different areas of the brain are active when someone is experiencing ASMR. The scientists think that these parts of the brain are using more dopamine and oxytocin hormones. These hormones can make some people feel calmer, less anxious and less worried. Another reason may be because you concentrate as you are listening to ASMR. You also breathe in and out more slowly and at the same rhythm and beat, so they help to regulate your breathing. Different ASMR sounds and experiences work for different people, so find the one that is best for you.

You can find out more about the science behind these apps here.
""".trim(),
                ),
                _cardSpacer(),
                _card(
                  title: "Essential oils and aromatherapy in playdoh and orbeex",
                  subtitle: "How does this help?",
                  body: """
                   In 2019, a study called Aromatherapy and Essential Oils: A Map of the Evidence looked at all of the research on Essential Oils and Aromatherapy and found that they can be helpful.

Your sense of smell (olfactory sense) is very powerful. Sensory scents (smells) are carried in your blood stream. They travel up your nose fast and act as a warning system to keep you safe by going directly to your brain (and not around your body first). They go to the hippocampus and amygdala. These two areas in your brain that store memories and emotions. This means scents miss the frontal cortex. This is the part of your brain where you think - and may have anxious or worrying thoughts. It also means that a scent misses the parts of your body where you're feeling anxiety. Instead, it can quickly start to work right in the hippocampus and the amygdala and help you to begin to feel calmer and more relaxed.

Scientists have found that we have many visual and emotional associations to certain smells and aromas. Many calming smells like vanilla also remind you of when you were a baby. The right smells for you can help you feel safe and secure. Feeling calm helps your body to breathe more slowly and deeply and helps your heartbeat to feel more regular, too. This is called regulating your breathing.
""".trim(),
                ),
                _cardSpacer(),
                _card(
                  title: "White, Pink and Brown Noise",
                  subtitle: "How does this help?",
                  body: """
                   IIt copies what it sounds like in the womb before you are born.
It helps you to feel safe and secure.
That doesn't mean it's quiet - the womb is noisy! There's blood whooshing around. Most of the outside real world sounds are muffled. You can hear a heart, beating. This constant, low level noise can make it a soothing and calmng space.

Hearing the heartbeat and sounds helps you to breathe in and out more slowly at the same rhythm and beat, so it helps to regulate your breathing.
Different White, Brown and Pink Noise sounds and experiences work for different people, so find the one that is best for you.
""".trim(),
                ),
                _cardSpacer(),
                _card(
                  title: "Sensory Regulatory games",
                  subtitle: "How does this help?",
                  body: """
                   Scientists tested these and saw that they make people feel calmer, less anxious and less worried.
One reason this happens is because you concentrate as you are doing them.
Moving your hands back and forward helps your heart, mind and body to feel more relaxed too. This helps your nervous system to feel less like there's something to worry or panic about, because your body is reacting an a way that tells it is should be worried and ready to do something (fight or flight).
Scientists have found that you breathe in and out more slowly and at the same rhythm and beat, so they help to regulate your breathing.
Different ones work for different people, so find the one that is best for you.
Scientists also found that they help to rewire and remodel your brain, to help you to feel regulated and more in control at other times.
""".trim(),
                ),
                _cardSpacer(),
                _card(
                  title: null,
                  body: "Copyright Coccon Kids Big Hug @ 2023",
                ),
              ],
            )
        )
    );
  }

}