import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pageloader.dart';
import '/widgets/onboarding/nextbutton.dart';
import '/widgets/onboarding/progressbar.dart';
import '/widgets/onboarding/questiontext.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: ChangeNotifierProvider(
      create: (BuildContext context) => PageLoader(),
      child: Container(
        margin: EdgeInsets.only(top: 46),
        child: Column(children: [
          ProgressBar(),
          QuestionText(),
          Container(
            height: 450,
          ),
          NextButton(),
        ]),
      ),
    ));
  }
}
